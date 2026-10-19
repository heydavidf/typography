# Security policy

## Reporting a vulnerability

Please report security problems privately through GitHub: open the repository's **Security** tab and choose **Report a vulnerability**. Do not open a public issue.

I maintain this project on my own, so I aim to acknowledge reports within 7 days and to fix confirmed problems as soon as I reasonably can. I will credit you in the fix unless you ask me not to.

## What to report

This repository holds Markdown instructions for agents, a small YAML metadata file, static HTML examples and the shell scripts behind its own checks. The skill ships no executable code. Useful reports include:

- instructions that could lead an agent to run commands, fetch remote content or handle files unsafely;
- an example or link that loads remote scripts or points somewhere harmful;
- a secret or personal data committed by mistake;
- a weakness in the checks in `.github/` or in the CI workflow.

Typography advice you disagree with, and ordinary documentation mistakes, are better as normal issues.

## Supported versions

The latest tagged release and the latest commit on `main` are supported. To move an older installed copy forward, run `gh skill update typography` or reinstall from the README.
