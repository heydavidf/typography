# Changelog

Notable changes to this repository. Version numbers follow [semantic versioning](https://semver.org/); a version gets its date when it is tagged.

## Unreleased (proposed 1.0.0)

The skill's instructions and references, and the example pages, are unchanged in this version. Only their location and the repository around them changed; the example notes got one updated link.

### Changed

- The skill moved from the repository root to `skills/typography/`, so `gh skill install heydavidf/typography typography` finds it. Before, it reported "no skills found". The folder holds everything the skill needs at run time, including a copy of the licence.
- The README leads with `gh skill install` for Claude Code, Codex and Grok, keeps a manual copy route, and explains how to upgrade a copy installed from the old layout.

### Added

- Automatic checks on every push to `main` and every pull request in `.github/workflows/ci.yml`: skill layout, tests for the check scripts, Agent Skills format, a tripwire for personal paths, junk files and silenced checks, secret scanning, and links (external links weekly).
- Dependabot updates for the pinned CI actions.
- `SECURITY.md`, `CONTRIBUTING.md`, `.gitignore`, this changelog, and working rules for contributors and their agents in `AGENTS.md`.

## First public version (2026-10-07, not tagged)

- The Typography skill with references on type and composition, web delivery and sources, fictional before/after examples and briefs, and the MIT licence.
