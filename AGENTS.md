# Typography contributor guide

This repository is a standalone typography skill. `skills/typography/SKILL.md` is the operational authority; the README owns installation and public capability claims. Use only the user's supplied project authority and assets when applying it.

- `skills/typography/`: the installable skill. Everything the skill needs at run time lives here, because `gh skill install` copies only this folder.
- `skills/typography/references/type-and-composition.md`: face roles, spacing and grids.
- `skills/typography/references/web-delivery.md`: asset delivery and distinct verification checks.
- `skills/typography/references/sources.md`: public attribution and interpretation boundaries.
- `skills/typography/agents/openai.yaml`: optional host interface metadata, not shared behavior.
- `skills/typography/LICENSE`: copy of the root `LICENSE` so installed copies carry it. Keep the two identical.
- `examples/`: fictional teaching specimens and representative briefs. Not installed with the skill.
- `.github/`: the CI workflow, the check scripts it runs and their tests (`test-checks.sh`). `CHANGELOG.md`, `CONTRIBUTING.md` and `SECURITY.md` sit at the root.

Keep the skill folder name equal to the `name` in its `SKILL.md`, and keep `SKILL.md` out of the repository root: `gh skill` looks for `skills/<name>/SKILL.md`. The repository ships one skill. A further skill would need its own `skills/<name>/` folder with a `SKILL.md` whose `name` matches the folder, everything it uses at run time, and a copy of the root `LICENSE`; the layout check and CI already cover every `skills/*/` folder, and the README would need its own install line.

Read the README install/use route before changing the package. Work on specimen copies outside the installation. Preserve copy, identity, semantic order and optional Counterform status. Do not bundle commercial/private font files or book pages. Update affected guidance and examples together; never turn a convenient numeric range into a universal accessibility rule. Add a line to `CHANGELOG.md` under Unreleased for any change a user would notice.

## Checks

Run these from the repository root before saying a change is done. CI runs the same checks in `.github/workflows/ci.yml` on every push to `main` and on pull requests. A weekly run repeats them without a base commit (so without the silenced-check comparison) and also checks external links.

```sh
bash .github/check-skill-layout.sh
bash .github/test-checks.sh
bash .github/tripwire.sh origin/main
gitleaks git --redact --no-banner .
gitleaks dir --redact --no-banner .
lychee --offline --no-progress .
```

In order: the skill folder, name and licence copy; tests for the two check scripts; personal paths, junk files and checks silenced since `main`; secrets in history and in the working files (gitleaks v8); local links in Markdown and HTML.

The tripwire takes the commit your change started from (`origin/main` in an ordinary clone of the GitHub repository). It fails if that commit is not available, rather than reporting clean; leave the argument out only to skip the silenced-check comparison on purpose. If you change a check script, add or update a case in `.github/test-checks.sh`. For the Agent Skills format check use Python 3.11+ and the official validator in a disposable environment:

```sh
python3 -m venv /tmp/typography-validator
/tmp/typography-validator/bin/python -m pip install 'skills-ref @ git+https://github.com/agentskills/agentskills.git@69ef37e9424c0a7ea9dd2293b559e43ec8176379#subdirectory=skills-ref'
/tmp/typography-validator/bin/skills-ref validate "$PWD/skills/typography"
```

Choose a fresh environment path if that example already exists. Pip/Git, gitleaks, lychee and network access are development dependencies, not requirements for using the installed skill. With GitHub CLI 2.100.0 or newer you can also run `gh skill publish --dry-run .`, which validates the skills the way `gh skill` does and does not publish anything; CI does not run it.

Open the examples in a browser and inspect at 1280px and 320px, with fallback fonts, enlargement and combined spacing overrides described in `skills/typography/references/web-delivery.md`. Check the representative briefs in `examples/README.md`; render rather than declaring success from CSS inspection. Record browser, width, measured results and visual observations separately. Changes to PDFs/documents require appropriate production proofs.

No build, runtime package installation, account integration or publishing step is needed. Browser automation, if available, may help but is not part of the shipped package. Do not claim cross-host discovery or full accessibility conformance from these checks.

## Working rules

1. **A bug fix ships with a committed test** that fails on the old version and passes on the new one. A one-off check in a temporary folder does not count. Here that is usually a check in `.github/` (as `check-skill-layout.sh` is for the folder layout) or a case in `.github/test-checks.sh`. For guidance changes, see `CONTRIBUTING.md`.
2. Run every check listed above before saying a change is done, and quote the output.
3. Don't silence a check to get green, for example with an ignore comment, a skipped test or a looser pattern. The tripwire fails the build on common silencing markers unless the line says `tripwire-allow:` followed by a reason.
4. Stop any server you started, such as a local preview server for the examples. Leave no stray files (caches, screenshots, scratch copies, `.DS_Store`) in the repository folder.
5. For a non-trivial change, a different agent writes an independent scenario test before the change is accepted: for example, a fresh agent installs the skill from your branch and applies it to one of the briefs in `examples/README.md`.
