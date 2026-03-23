#!/bin/sh
# Homebrew がなければインストールする（dotfiles 展開前に実行）
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon: シェルセッション内で即時 PATH に追加
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
