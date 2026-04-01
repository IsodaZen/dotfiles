#!/bin/sh
# anyenv経由でpyenv、nodenv、rbenvをインストール（初回のみ）

# anyenvがインストールされていなければスキップ
if ! command -v anyenv >/dev/null 2>&1; then
  echo "anyenv is not installed. Skipping..."
  exit 0
fi

# anyenv初期化（anyenv init未実行の場合）
if [ ! -d "${HOME}/.config/anyenv/anyenv-install" ]; then
  anyenv install --init
fi

# anyenv環境のロード
eval "$(anyenv init -)"

# pyenvのインストール
if ! anyenv versions 2>&1 | grep -q pyenv; then
  echo "Installing pyenv via anyenv..."
  anyenv install pyenv
fi

# nodenvのインストール
if ! anyenv versions 2>&1 | grep -q nodenv; then
  echo "Installing nodenv via anyenv..."
  anyenv install nodenv
fi

# rbenvのインストール
if ! anyenv versions 2>&1 | grep -q rbenv; then
  echo "Installing rbenv via anyenv..."
  anyenv install rbenv
fi

echo "anyenv plugins setup completed."
