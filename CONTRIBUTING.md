# Contributing

Thanks for your interest. This is a small project maintained by one person, so issues and small pull requests are the most helpful.

## Before you open a pull request

1. Open an issue first for anything larger than a small fix, so we can agree on the approach.
2. Run the checks listed in [AGENTS.md](AGENTS.md) (the same checks CI runs in [`.github/workflows/ci.yml`](.github/workflows/ci.yml)). They must pass.
3. A bug fix should come with a test that fails before the fix and passes after it. In this repository that is usually a check in `.github/` or a case in `.github/test-checks.sh`. A change to the typography guidance should come with a rendered before/after example, or an updated brief in `examples/`, that shows what changes for a reader.
4. Keep the change focused: one problem per pull request.
5. Keep the skill in `skills/typography/`, with everything it needs at run time inside that folder. To propose another skill, open an issue first; `AGENTS.md` describes the folder layout it would need.
6. Do not include private project files, licensed font files, book pages or credentials.

## Using coding agents

Agent-written changes are welcome. Please read the diff yourself before submitting, and say in the pull request which agent you used.

## Licence

By contributing you agree that your contribution is licensed under the same licence as the project (see [LICENSE](LICENSE)).
