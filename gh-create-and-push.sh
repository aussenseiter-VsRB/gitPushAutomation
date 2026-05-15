#!/usr/bin/env bash
set -euo pipefail

visibility="${2:-public}"
repo_name="${1:-}"
if [ -z "$repo_name" ]; then
  repo_name="$(basename "$(pwd)")"
fi

# 1. Init git if not already a repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "==> Initializing git repo ..."
  git init
fi

# 2. Create initial commit if none exist
if ! git rev-parse HEAD &>/dev/null; then
  echo "==> Creating initial commit ..."
  git add -A
  git commit -m "Initial commit"
fi

# 3. Rename branch to main if it's master
current_branch="$(git branch --show-current)"
if [ "$current_branch" = "master" ]; then
  echo "==> Renaming branch to main ..."
  git branch -m main
fi

# 4. Create GitHub repo and push
echo "==> Creating $visibility GitHub repo '$repo_name' ..."
gh repo create "$repo_name" "--$visibility" --source=. --remote=origin --push
