# Dotfiles

[![Linting](https://github.com/yellow5/dotfiles/actions/workflows/linting.yml/badge.svg)](https://github.com/yellow5/dotfiles/actions/workflows/linting.yml)
[![Security](https://github.com/yellow5/dotfiles/actions/workflows/security.yml/badge.svg)](https://github.com/yellow5/dotfiles/actions/workflows/security.yml)

Cameron's personal dotfiles.

## Install

`bin/hlink` symlinks the tracked dotfiles listed in the script into `$HOME`:

```sh
bin/hlink        # create the symlinks
bin/hlink -u     # remove them
bin/hlink -h     # help
```

## Linting

Each surface has its own linter; CI (`.github/workflows/linting.yml`) runs them
on every pull request, one job per surface.

| Surface | Files | Tool |
|---|---|---|
| Bash | `.bashrc`, `.bash_profile`, `.bash_aliases`, `.bash_functions`, `bin/vimbundles.sh` | [ShellCheck](https://www.shellcheck.net/) + [shfmt](https://github.com/mvdan/sh) |
| Zsh | `.zshrc` | `zsh -n` |
| Ruby | `bin/hlink` | [StandardRB](https://github.com/standardrb/standard) |
| Vimscript | `.vimrc` | [vint](https://github.com/Vimjas/vint) |

Ruby and Python tooling is pinned in `Gemfile` / `pyproject.toml` (with committed
lockfiles); ShellCheck and shfmt have no package manager, so they come from the
runner image / a pinned setup action in CI.

### Running locally

```sh
brew install shellcheck shfmt   # shell tools
bundle install                  # StandardRB
uv sync                         # vint

shellcheck -x .bashrc .bash_profile .bash_aliases .bash_functions bin/vimbundles.sh
shfmt -d -i 2 -ci -sr -ln bash .bashrc .bash_functions .bash_aliases .bash_profile
shfmt -d -i 2 -ci -sr bin/vimbundles.sh
zsh -n .zshrc
bundle exec standardrb
uv run vint .vimrc
```

Or, optionally, run everything through [pre-commit](https://pre-commit.com/):

```sh
brew install pre-commit
pre-commit install              # runs the checks on every commit
pre-commit run --all-files
```
