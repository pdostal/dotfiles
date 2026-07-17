# Sandbox environment notes

This is an openSUSE Tumbleweed container with no root and no sudo. Commands
like `zypper install` or `rpm -i`/`-U` will always fail here, so don't retry
them or try to work around it — `zypper se <package>` still works for
checking exact package names to suggest to the user. If a task needs a
system package, tell the user the exact `zypper install ...` line to add to
the container image rather than trying to install it yourself.

This sandbox has no QEMU/KVM, display, or worker infrastructure, so don't
assume a task requires running full integration or VM-based test suites
(e.g. openQA/isotovideo). Prefer unit tests, syntax/lint checks (e.g.
`perl -c`, `perlcritic`, `shellcheck`, `ruff`), and doc checkers (e.g.
`podchecker`) for verification unless explicitly asked for something
heavier.

# Coding rules

- Keep comments terse and only add them when genuinely needed, e.g. for
  complex function definitions.
- Prefer one-liners over spreading a function call across multiple lines.

# Shell rules

- `gh`, `glab`, and `git` are pre-configured and already authenticated —
  don't try to log in or reconfigure them.
- Git operations that need the SSH key or a commit signature go through a
  YubiKey — wait for the user to touch it, and keep in mind they might miss
  the prompt the first time, so be patient before retrying.
- If a task needs a new program, ask the user to add it to the container
  image rather than trying to install it yourself.
- Always look at the current directory and git branch - the user might be
  reffering to already openned pull request.

