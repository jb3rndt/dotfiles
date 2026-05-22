#!/bin/zsh

if command -v git-lfs >/dev/null 2>&1; then
  GIT_LFS_BIN=$(command -v git-lfs)
elif [[ -x /opt/homebrew/bin/git-lfs ]]; then
  GIT_LFS_BIN=/opt/homebrew/bin/git-lfs
elif [[ -x /usr/local/bin/git-lfs ]]; then
  GIT_LFS_BIN=/usr/local/bin/git-lfs
else
  printf >&2 "\n%s\n\n" "This repository is configured for Git LFS but 'git-lfs' was not found on your path. If you no longer wish to use Git LFS, remove this hook by deleting the hook file in the hooks directory (set by 'core.hookspath'; usually '.git/hooks')."
  exit 2
fi

export GIT_LFS_BIN
