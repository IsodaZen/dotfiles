# CLAUDE.md — dotfiles (chezmoi)

## リポジトリの目的

[chezmoi](https://www.chezmoi.io/) を使って macOS の環境設定ファイル（dotfiles）を管理するリポジトリです。

---

## MUST: 編集時の注意

- **実ファイル（`~/.zshrc` 等）を直接編集してはいけません。**
  このリポジトリ内のソースファイル（`dot_zshrc` 等）を編集し、`chezmoi apply` で反映します。
- `dot_` プレフィックスを外した名前が実際のファイル名です。迷ったら上記の構成表を参照してください。

---

## chezmoi 命名規則

詳細は [.claude/references/chezmoi.md](.claude/references/chezmoi.md) を参照。

---

## ファイル構成

```text
chezmoi/
├── dot_bash/conf/
│   ├── homebrew.conf                      # Homebrew PATH設定（macOS専用）
│   └── bun.conf                           # Bun ランタイム設定
├── dot_bash_profile                       # ~/.bash_profile
├── dot_bashrc                             # ~/.bashrc（エイリアス、PATH、共通設定）
├── dot_config/nvim/
│   ├── init.vim / dein.toml / dein_lazy.toml
│   └── config/*.vim                       # プラグイン・言語別設定
├── dot_config/wezterm/wezterm.lua         # ~/.config/wezterm/wezterm.lua
├── dot_gitconfig                          # ~/.gitconfig
├── dot_zsh/conf/
│   ├── key-binding.conf                   # bashのconf読み込み（zsh経由）
│   └── set-prompt.conf                    # zshプロンプト設定
├── dot_zshrc                              # ~/.zshrc
├── empty_dot_zprofile                     # ~/.zprofile（空ファイル）
│   ------------------------------------------------------------------------------------------------------------------
├── run_once_before_install-homebrew.sh    # Homebrew インストール（dotfiles展開前・初回のみ）
├── run_onchange_install-brew-packages.sh  # brew パッケージインストール（パッケージリスト変更時）
├── run_once_install-bun.sh                # Bun インストール（初回のみ）
│   ------------------------------------------------------------------------------------------------------------------
├── CLAUDE.md                              # このファイル（AI用、chezmoiは無視）
└── README.md                              # ドキュメント
```

---

## 主要コマンド

```bash
# 変更をホームディレクトリに適用
chezmoi apply

# ソースと実ファイルの差分確認
chezmoi diff

# 実ファイルの変更をソースに取り込む
chezmoi re-add ~/.zshrc

# ソースファイルを直接編集
chezmoi edit ~/.zshrc
```

---

## 動作環境

- **OS:** macOS (Apple Silicon / arm64)
- **Shell:** zsh（メイン）、bash（サブシェル・スクリプト用）
- **前提ツール:** Homebrew（`/opt/homebrew`）、Bun
