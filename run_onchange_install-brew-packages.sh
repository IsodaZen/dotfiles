#!/bin/sh
# パッケージリストを変数で管理（変更すると chezmoi apply 時に再実行される）
PACKAGES="
  chezmoi
  neovim
  git
  anyenv
"
CASKS="
  wezterm
  font-cica
  claude-code
"

eval "$(/opt/homebrew/bin/brew shellenv)"

# shellcheck disable=SC2086
brew install $PACKAGES
# shellcheck disable=SC2086
brew install --cask $CASKS
