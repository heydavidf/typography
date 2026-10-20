# Typography

Make reading feel considered, interfaces easier to scan, and display type more deliberate. Typography is an agent skill for choosing and refining type, hierarchy, spacing and grids while preserving an existing identity.

It starts with actual content and the reading task, then delivers a focused critique, implemented refinement or reusable system with concrete settings and honest verification. It works without Counterform, reference books or downloaded fonts.

![The same fictional article before and after typography refinement](examples/before-after.png)

[Open the before/after example](examples/before-after.html) · [Skill instructions](skills/typography/SKILL.md) · [Sources and attribution](skills/typography/references/sources.md) · [Agent contributor guide](AGENTS.md)

## Install

You need a file-capable agent that can read Markdown skills and their relative references. No API key, connector, account or paid service is required by this package; your agent host may have its own subscription or usage costs. Rendering requires a browser, and production font work requires fonts you have permission to use. PDF/document delivery requires suitable production tools in your host.

The skill is the [`skills/typography/`](skills/typography/) folder: `SKILL.md`, its `references/`, optional `agents/openai.yaml` interface metadata and a copy of the licence. The rest of this repository (this README, the examples and the checks) is not needed at run time.

### With GitHub CLI

```sh
gh skill install heydavidf/typography typography --agent claude-code --scope user
```

For Codex use `--agent codex`, and for Grok use `--agent grok`. `gh skill install --help` lists every supported agent. `--scope user` makes the skill available in all your projects; leave it out to install into the current repository only. With GitHub CLI 2.100.0, user scope placed the skill in `~/.claude/skills/typography` for Claude Code, `~/.agents/skills/typography` for Codex and `~/.grok/skills/typography` for Grok.

`gh skill` is a preview feature of GitHub CLI and may change without notice. It reminds you to review a skill before use, which is good advice: the installed files are plain Markdown plus one small YAML file. It also adds a `metadata` entry to the installed `SKILL.md` frontmatter so that `gh skill update` can find newer versions later. Without a version it installs the latest tagged release, or `main` when there is none.

### Manual copy

Without GitHub CLI, clone the repository and copy the skill folder into your agent's skills folder. Paste this into a terminal running bash or zsh. The first line names Claude Code's skills folder; change it if your agent keeps skills elsewhere. It never overwrites an existing installation:

```sh
TYPOGRAPHY_SKILLS_DIR="$HOME/.claude/skills"
if [ -e "$TYPOGRAPHY_SKILLS_DIR/typography" ]; then
  echo "Typography is already installed in $TYPOGRAPHY_SKILLS_DIR. Move that copy aside before updating."
elif git clone https://github.com/heydavidf/typography.git typography-repo; then
  mkdir -p "$TYPOGRAPHY_SKILLS_DIR" && cp -R typography-repo/skills/typography "$TYPOGRAPHY_SKILLS_DIR/" && echo "Installed in $TYPOGRAPHY_SKILLS_DIR/typography. Reload your agent."
else
  echo "The clone failed. If a typography-repo folder already exists here, remove it or run this in another folder."
fi
```

The clone also gives you the `examples/` folder used below. If you downloaded a ZIP instead, copy its `skills/typography` folder the same way.

### After installing

Confirm the destination contains `typography/SKILL.md` and `typography/references/`. For automatic activation, follow your host's own reload/discovery instructions and check that Typography is listed. Automatic discovery across different hosts is not established by this package. If discovery is unavailable, explicitly ask your agent to read the installed `SKILL.md` and follow its relative references.

**Upgrading from an earlier copy:** the skill used to sit at the root of this repository, and the old manual install copied the whole repository. It now lives in `skills/typography/` and only that folder is installed. The manual copy refuses to overwrite an existing install, and `gh skill install` will not replace one unless you confirm or pass `--force`, so first move your old installed `typography` folder aside (copy out any notes you added to it), then install again. The skill's instructions and references are unchanged.

## Ask your agent

```text
Install the Typography skill from https://github.com/heydavidf/typography
by following its README: use gh skill install if GitHub CLI is available,
otherwise the manual copy. If Typography is already installed, ask me
before replacing it. Then read the installed typography/SKILL.md. Get
examples/editorial.html and examples/specimens.css from the repository
(the installed skill does not include them) and refine a copy in a working
folder I choose. Keep the copy and font stack. Deliver the HTML, exact
typography settings, before/after reasons and checks actually run. Use the
public references only; do not install fonts or publish anything.
```

If already installed, say “Use Typography to refine this page, preserving its established typefaces,” and supply the page, its design authority and the desired output. In hosts supporting named skill syntax, `$typography` is also a useful explicit invocation.

## First result

Open [before-after.html](examples/before-after.html) directly in a browser. Both sides use identical fictional copy and the same serif stack; the change comes from measure, leading, hierarchy and spacing. No network access is needed. The deliberately weak before state is a teaching example, not recommended production styling.

[Example notes and briefs](examples/README.md) explain the settings and give three tasks: editorial reading, an existing-brand interface, and expressive display. The examples live in this repository, not in the installed skill. Work on a copy outside the installed skill. A useful result includes implemented settings, reasons and an accurate account of rendering checks, not just a list of font names.

## Scope and verification

The skill gives design guidance, not a universal pairing score, a replacement for full product design, a font generator or an accessibility certification. Its numerical ranges are starting experiments. It preserves authorial copy and intentional brand choices.

System font stacks make the bundled specimens self-contained, but exact glyphs vary by platform. A real project must inspect its licensed assets, supported weights, axes, languages and fallback behavior. If an asset or renderer is missing, the agent should state what is missing, preserve the established choice and distinguish a proposal from a verified render.

Every push to `main` and every pull request runs the checks in [`.github/workflows/ci.yml`](.github/workflows/ci.yml): skill layout, tests for those check scripts, Agent Skills format, a tripwire for personal paths, junk files and silenced checks, secret scanning and local links. A weekly run repeats the checks and also tests external links. Before a release the maintainer also installs the skill in a fresh, restricted macOS environment and has an agent apply it to the fictional briefs; those checks run outside this repository, and the example pages were last rendered in Chromium when they changed. None of this establishes automatic discovery in every agent host, real browser zoom, print proof quality or full WCAG conformance. Read the example notes for the distinction between a root-font-size probe and browser zoom.

Counterform is an optional specimen/export companion when separately available. The skill and examples do not require it or another unpublished skill.

## Update, remove and contribute

With GitHub CLI, run `gh skill update typography` to check for and install a newer version. With a manual copy, preserve local customizations, compare the new `skills/typography` folder, then replace only the reviewed installed files. To remove, delete only the installed `typography` folder after confirming the path; GitHub CLI 2.100.0 has no remove command for skills. Your project outputs remain in your chosen working folder.

For a contribution, read [CONTRIBUTING.md](CONTRIBUTING.md) and [AGENTS.md](AGENTS.md), which lists the checks to run. Report issues with a small synthetic reproduction, browser/version and expected behavior. Do not include private project files, licensed font binaries or credentials. Support is best effort; there is no promised response time. Use repository issues for ordinary bugs and [private vulnerability reporting](SECURITY.md) for sensitive findings. [CHANGELOG.md](CHANGELOG.md) records what changed between versions.

The original skill and examples are covered by the [MIT licence](LICENSE); a copy sits inside `skills/typography/` so every installed copy carries it. The books, articles and standards in [sources](skills/typography/references/sources.md) retain their respective rights. No book pages, font files or third-party code are redistributed.
