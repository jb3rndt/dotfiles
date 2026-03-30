#!/usr/bin/env zsh

# Usage: yeet "commit message"
yeet() {
  local msg="$1"
  if [ -z "$msg" ]; then
    echo "Usage: yeet \"commit message\""
    return 2
  fi

  if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "Not a git repository (or no .git directory found)."
    return 1
  fi

  git add -A

  local staged
  staged=$(git diff --cached --name-only || true)
  if [ -z "$staged" ]; then
    echo "No changes to commit."
    return 0
  fi

  echo "Changes:"
  git --no-pager diff --stat --cached
  echo
  printf "Commit with message '$msg' and push? [Enter/n] "
  IFS= read -r confirm
  echo
  confirm=${confirm:-y}
  if [[ "$confirm" =~ ^[Yy] ]]; then
    if git commit -m "$msg"; then
      if git push; then
        echo "Pushed."
        return 0
      else
        echo "Push failed." >&2
        return 3
      fi
    else
      echo "Commit failed." >&2
      return 4
    fi
  else
    echo "Aborted."
    return 5
  fi
}
