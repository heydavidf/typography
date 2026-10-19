# Typography contributor guide

This repository is a standalone typography skill. `skills/typography/SKILL.md` is the operational authority; the README owns installation and public capability claims. Use only the user's supplied project authority and assets when applying it.

- `skills/typography/`: the installable skill. Everything the skill needs at run time lives here, because `gh skill install` copies only this folder.
- `skills/typography/references/type-and-composition.md`: face roles, spacing and grids.
- `skills/typography/references/web-delivery.md`: asset delivery and distinct verification checks.
- `skills/typography/references/sources.md`: public attribution and interpretation boundaries.
- `skills/typography/agents/openai.yaml`: optional host interface metadata, not shared behavior.
- `skills/typography/LICENSE`: copy of the root `LICENSE` so installed copies carry it. Keep the two identical.
- `examples/`: fictional teaching specimens and representative briefs. Not installed with the skill.

Keep the skill folder name equal to the `name` in its `SKILL.md`, and keep `SKILL.md` out of the repository root: `gh skill` looks for `skills/<name>/SKILL.md`.

Read the README install/use route before changing the package. Work on specimen copies outside the installation. Preserve copy, identity, semantic order and optional Counterform status. Do not bundle commercial/private font files or book pages. Update affected guidance and examples together; never turn a convenient numeric range into a universal accessibility rule.

For format checks use Python 3.11+ and the official Agent Skills validator in a disposable environment:

```sh
python3 -m venv /tmp/typography-validator
/tmp/typography-validator/bin/python -m pip install 'skills-ref @ git+https://github.com/agentskills/agentskills.git@69ef37e9424c0a7ea9dd2293b559e43ec8176379#subdirectory=skills-ref'
/tmp/typography-validator/bin/skills-ref validate "$PWD/skills/typography"
```

Choose a fresh environment path if that example already exists. Pip/Git and network access are development dependencies, not requirements for using the installed skill. Review repository-relative Markdown links. Open the examples in a browser and inspect at 1280px and 320px, with fallback fonts, enlargement and combined spacing overrides described in `skills/typography/references/web-delivery.md`. Check the representative briefs in `examples/README.md`; render rather than declaring success from CSS inspection. Record browser, width, measured results and visual observations separately. Changes to PDFs/documents require appropriate production proofs.

No build, runtime package installation, account integration or publishing step is needed. Browser automation, if available, may help but is not part of the shipped package. Do not claim cross-host discovery or full accessibility conformance from these checks.
