#!/usr/bin/env bash
# check-skill-layout.sh: fail unless every skill sits where `gh skill install OWNER/REPO <name>` finds it.
# Usage: bash .github/check-skill-layout.sh   (from anywhere inside the repository)
# Checks, for tracked files:
#   1. At least one skills/<name>/SKILL.md exists, and no SKILL.md is tracked anywhere else
#      (a root SKILL.md made `gh skill install` report "no skills found").
#   2. Each SKILL.md starts with a frontmatter block whose `name` equals its folder name and
#      follows the Agent Skills naming rule (lowercase letters, digits, single hyphens, 1-64 chars).
#   3. Each skill folder carries a copy of the root LICENSE that is identical to it.
# Exit 1 on any failure.
set -uo pipefail

root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Run this inside the repository (git is required)."; exit 1; }
cd "$root" || exit 1

fail=0
report() { printf '%s\n' "$1"; fail=1; }

skills=$(git ls-files -- 'skills/*/SKILL.md' | grep -E '^skills/[^/]+/SKILL\.md$' || true)
strays=$(git ls-files | grep -E '(^|/)SKILL\.md$' | grep -v -E '^skills/[^/]+/SKILL\.md$' || true)

[ -z "$skills" ] && report "No skills/<name>/SKILL.md is tracked. gh skill install looks for skills/*/SKILL.md."
[ -n "$strays" ] && report "SKILL.md outside skills/<name>/ (move it into skills/<name>/):
$strays"

count=0
while IFS= read -r file; do
  [ -n "$file" ] || continue
  dir=${file%/SKILL.md}
  folder=${dir#skills/}
  count=$((count + 1))
  if [ "$(head -n 1 "$file")" != "---" ]; then
    report "$file: must start with a '---' frontmatter line."
    continue
  fi
  # The name field from the first frontmatter block, with optional quotes removed.
  name=$(awk 'NR == 1 { next } /^---[[:space:]]*$/ { exit } /^name:/ { sub(/^name:[[:space:]]*/, ""); sub(/[[:space:]]+$/, ""); gsub(/^["\047]|["\047]$/, ""); print; exit }' "$file")
  if [ -z "$name" ]; then
    report "$file: frontmatter has no name field."
  elif [ "$name" != "$folder" ]; then
    report "$file: name '$name' does not match its folder '$folder'."
  elif [ "${#name}" -gt 64 ] || ! printf '%s' "$name" | grep -q -E '^[a-z0-9]+(-[a-z0-9]+)*$'; then
    report "$file: name '$name' must be 1-64 lowercase letters, digits and single hyphens."
  fi
  if [ ! -f "$dir/LICENSE" ]; then
    report "$dir/LICENSE is missing. Copy the root LICENSE into the skill folder so installed copies carry it."
  elif ! cmp -s LICENSE "$dir/LICENSE"; then
    report "$dir/LICENSE differs from the root LICENSE."
  fi
done < <(printf '%s\n' "$skills")

[ "$fail" -eq 0 ] && echo "skill layout: $count skill(s) in skills/<name>/, names and licences match"
exit "$fail"
