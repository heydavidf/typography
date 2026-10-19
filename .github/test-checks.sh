#!/usr/bin/env bash
# test-checks.sh: tests for the repository's own check scripts, run by CI.
# Usage: bash .github/test-checks.sh   (from anywhere inside the repository)
# Builds small throwaway git repositories in a temporary folder, runs check-skill-layout.sh and
# tripwire.sh against them, and compares each exit code with the expected one. Nothing is written
# inside this repository. Markers that the tripwire looks for are assembled at run time so that
# this file does not trip the tripwire itself.
set -uo pipefail

root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Run this inside the repository (git is required)."; exit 1; }
layout="$root/.github/check-skill-layout.sh"
tripwire="$root/.github/tripwire.sh"
work=$(mktemp -d "${TMPDIR:-/tmp}/typography-checks.XXXXXX") || exit 1
trap 'rm -rf -- "$work"' EXIT

export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1
g() { git -c user.name=test -c user.email=test@example.invalid -c commit.gpgsign=false -c core.hooksPath=/dev/null "$@"; }

failures=0
n=0
expect() { # expect EXIT_CODE "description" command...
  local want="$1" what="$2"; shift 2
  n=$((n + 1))
  local out rc
  out=$("$@" 2>&1); rc=$?
  if [ "$rc" -eq "$want" ]; then
    printf 'ok %d - %s\n' "$n" "$what"
  else
    printf 'FAIL %d - %s (exit %d, expected %d)\n%s\n' "$n" "$what" "$rc" "$want" "$out"
    failures=$((failures + 1))
  fi
}

# A fresh repository holding a copy of this repository's tracked files, committed once.
fixture() {
  local dir="$work/$1"
  mkdir -p "$dir"
  (cd "$root" && git ls-files -z | tar --null -T - -cf -) | tar -xf - -C "$dir"
  g -C "$dir" init -q
  g -C "$dir" add -A
  g -C "$dir" commit -q -m base
  printf '%s\n' "$dir"
}
in_dir() { local d="$1"; shift; (cd "$d" && "$@"); }

# Skill layout
d=$(fixture layout-ok)
expect 0 "layout: this repository passes" in_dir "$d" bash "$layout"

d=$(fixture layout-root)
g -C "$d" mv skills/typography/SKILL.md SKILL.md
expect 1 "layout: SKILL.md at the repository root fails (the old layout)" in_dir "$d" bash "$layout"

d=$(fixture layout-name)
g -C "$d" mv skills/typography skills/type-tools
expect 1 "layout: folder name different from the SKILL.md name fails" in_dir "$d" bash "$layout"

d=$(fixture layout-licence)
g -C "$d" rm -q skills/typography/LICENSE
expect 1 "layout: missing licence copy fails" in_dir "$d" bash "$layout"

d=$(fixture layout-licence-drift)
printf 'extra\n' >> "$d/skills/typography/LICENSE"
expect 1 "layout: licence copy that differs from the root fails" in_dir "$d" bash "$layout"

d=$(fixture layout-space)
g -C "$d" mv skills/typography "skills/type graphy"
expect 1 "layout: folder name with a space fails without breaking the loop" in_dir "$d" bash "$layout"

expect 1 "layout: outside a git repository fails" in_dir "$work" bash "$layout"

# Tripwire: git problems must fail, never report clean
d=$(fixture trip-ok)
base=$(g -C "$d" rev-parse HEAD)
expect 0 "tripwire: unchanged repository is clean" in_dir "$d" bash "$tripwire" "$base"
expect 1 "tripwire: a base that does not exist fails instead of reporting clean" in_dir "$d" bash "$tripwire" no-such-ref
expect 1 "tripwire: outside a git repository fails instead of reporting clean" in_dir "$work" bash "$tripwire"
expect 1 "tripwire: inside the .git folder fails instead of reporting clean" in_dir "$d/.git" bash "$tripwire"
expect 1 "tripwire: an invalid TRIPWIRE_WORDS pattern fails instead of skipping the check" in_dir "$d" env TRIPWIRE_WORDS='foo(' bash "$tripwire"

# Tripwire: lines that silence a check
markers=(
  "      continue-on-$(printf error): true"
  "# gitleaks$(printf ':')allow"
  "# shellcheck$(printf ' ')disable=SC2034"
  "          fail$(printf ':') false"
  "// eslint$(printf '-')disable-line"
)
i=0
for m in "${markers[@]}"; do
  i=$((i + 1))
  d=$(fixture "trip-marker-$i")
  base=$(g -C "$d" rev-parse HEAD)
  printf '%s\n' "$m" >> "$d/.github/workflows/ci.yml"
  g -C "$d" commit -q -am "marker $i"
  expect 1 "tripwire: added line '${m#"${m%%[! ]*}"}' fails" in_dir "$d" bash "$tripwire" "$base"
done

d=$(fixture trip-allow-bare)
base=$(g -C "$d" rev-parse HEAD)
printf '      continue-on-%s: true  # tripwire-allow\n' error >> "$d/.github/workflows/ci.yml"
g -C "$d" commit -q -am "marker without a reason"
expect 1 "tripwire: tripwire-allow without a reason does not excuse a line" in_dir "$d" bash "$tripwire" "$base"

d=$(fixture trip-allowed)
base=$(g -C "$d" rev-parse HEAD)
printf '      continue-on-%s: true  # tripwire-allow: test of the escape hatch\n' error >> "$d/.github/workflows/ci.yml"
g -C "$d" commit -q -am "allowed exception"
expect 0 "tripwire: the same line with tripwire-allow and a reason passes" in_dir "$d" bash "$tripwire" "$base"

# Tripwire: files that can switch a check off
for name in .gitleaksignore .gitleaks.toml .lycheeignore lychee.toml .shellcheckrc .gitattributes; do
  d=$(fixture "trip-file$name")
  base=$(g -C "$d" rev-parse HEAD)
  printf 'example\n' > "$d/$name"
  g -C "$d" add -f "$name"
  g -C "$d" commit -q -m "add $name"
  expect 1 "tripwire: a new $name without a reason fails" in_dir "$d" bash "$tripwire" "$base"
done

d=$(fixture trip-file-renamed)
base=$(g -C "$d" rev-parse HEAD)
g -C "$d" mv examples/README.md .gitleaksignore
g -C "$d" commit -q -m "rename into an ignore file"
expect 1 "tripwire: a file renamed to .gitleaksignore without a reason fails" in_dir "$d" bash "$tripwire" "$base"

d=$(fixture trip-file-allowed)
base=$(g -C "$d" rev-parse HEAD)
printf '# tripwire-allow: publisher blocks automated requests\nhttps://example.invalid/\n' > "$d/.lycheeignore"
g -C "$d" add .lycheeignore
g -C "$d" commit -q -m "explained ignore file"
expect 0 "tripwire: a new .lycheeignore with a tripwire-allow reason passes" in_dir "$d" bash "$tripwire" "$base"

# Tripwire: junk files and personal paths, from the root and from a subfolder
d=$(fixture trip-junk)
touch "$d/.DS_Store"
g -C "$d" add -f .DS_Store
g -C "$d" commit -q -m junk
expect 1 "tripwire: a tracked .DS_Store fails" in_dir "$d" bash "$tripwire"

d=$(fixture trip-personal)
printf 'see %s/someone/notes\n' "/Us""ers" >> "$d/README.md"
g -C "$d" commit -q -am "personal path"
expect 1 "tripwire: a personal home path fails" in_dir "$d" bash "$tripwire"
expect 1 "tripwire: run from a subfolder still checks the whole repository" in_dir "$d/skills" bash "$tripwire"

echo
if [ "$failures" -eq 0 ]; then
  echo "check tests: all $n passed"
else
  echo "check tests: $failures of $n failed"
fi
[ "$failures" -eq 0 ]
