# Writing rules

Commit bodies, PR/MR descriptions, GitHub/GitLab comments and reviews, Redmine
comments and ticket descriptions, and Bugzilla comments are all kept minimal
and to the point — one short paragraph per issue, category, or area covered,
no filler, no restating the obvious, no sales pitch. State what was done or
what's being reported, nothing more.

Before posting or sending anything to a public system (PR/MR comments,
reviews, Redmine comments, Bugzilla comments, etc.), ask the user for
confirmation first — never publish automatically.

# Sandbox environment notes

This is an openSUSE Tumbleweed container with no root, no sudo, and no
QEMU/KVM, display, or worker infrastructure. Commands like `zypper install`
or `rpm -i`/`-U` will always fail, so don't retry them or try to work around
it — `zypper se <package>` still works for checking exact package names to
suggest to the user, and if a task needs a system package, tell the user the
exact `zypper install ...` line to add to the container image rather than
installing it yourself. Since there's no VM/worker infra, don't assume a
task needs full integration or VM-based test suites (e.g. openQA/isotovideo)
— prefer unit tests, syntax/lint checks (`perl -c`, `perlcritic`,
`shellcheck`, `ruff`), and doc checkers (`podchecker`) for verification
unless explicitly asked for something heavier.

# Coding rules

- Keep comments terse and only add them when genuinely needed, e.g. for
  complex function definitions.
- Prefer one-liners over spreading a function call across multiple lines.
  When multi line comment is needed don't go over 3 lines.

# Shell rules

- `gh`, `glab`, and `git` are pre-configured and already authenticated —
  don't try to log in or reconfigure them.
- Git operations that need the SSH key or a commit signature go through a
  YubiKey — wait for the user to touch it, and keep in mind they might miss
  the prompt the first time, so be patient before retrying.
- If a task needs a new program, ask the user to add it to the container
  image rather than trying to install it yourself.
