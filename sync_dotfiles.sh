#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"

# Brewfileを最新状態にダンプ
brew bundle dump --force --file=Brewfile

# 変更があればcommit & push
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "chore: auto-sync dotfiles $(date +%Y-%m-%d)"
  git push origin master
fi
