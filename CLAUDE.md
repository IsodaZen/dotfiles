# CLAUDE.md — dotfiles (chezmoi)

## リポジトリの目的

[chezmoi](https://www.chezmoi.io/) を使って macOS の環境設定ファイル（dotfiles）を管理するリポジトリです。

---

## chezmoi 命名規則

chezmoi はソースディレクトリのファイル名をプレフィックスで解釈し、ホームディレクトリへ展開します。

| プレフィックス | 展開後 |
| -------------- | ------ |
| `dot_` | `.`（ドット）に置換 |
| `empty_` | 空ファイルとして作成 |
| `executable_` | 実行権限付きで作成 |
| `run_once_` | 初回のみ実行されるスクリプト（ハッシュで追跡） |
| `run_onchange_` | ファイル内容が変わるたびに実行されるスクリプト |
| `run_once_before_` | 初回かつ dotfiles 展開前に実行されるスクリプト |
| プレフィックスなし | chezmoi が無視（AI用ドキュメントはここに置く） |

**例：** `dot_zshrc` → `~/.zshrc`、`dot_config/wezterm/wezterm.lua` → `~/.config/wezterm/wezterm.lua`

---

## ファイル構成

```text
chezmoi/
├── CLAUDE.md                              # このファイル（AI用、chezmoiは無視）
├── .chezmoiignore                         # chezmoiが無視するファイルの明示定義
├── run_once_before_install-homebrew.sh    # Homebrew インストール（dotfiles展開前・初回のみ）
├── run_onchange_install-brew-packages.sh  # brew パッケージインストール（パッケージリスト変更時）
├── run_once_install-bun.sh                # Bun インストール（初回のみ）
├── dot_zshrc                              # ~/.zshrc
├── dot_zsh/conf/
│   ├── key-binding.conf                   # bashのconf読み込み（zsh経由）
│   └── set-prompt.conf                    # zshプロンプト設定
├── dot_bashrc                             # ~/.bashrc（エイリアス、PATH、共通設定）
├── dot_bash_profile                       # ~/.bash_profile
├── dot_bash/conf/
│   ├── homebrew.conf                      # Homebrew PATH設定（macOS専用）
│   └── bun.conf                           # Bun ランタイム設定
├── dot_gitconfig                          # ~/.gitconfig
├── dot_config/wezterm/wezterm.lua         # ~/.config/wezterm/wezterm.lua
└── empty_dot_zprofile                     # ~/.zprofile（空ファイル）
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

## 編集時の注意

- **実ファイル（`~/.zshrc` 等）を直接編集してはいけません。**
  このリポジトリ内のソースファイル（`dot_zshrc` 等）を編集し、`chezmoi apply` で反映します。
- `dot_` プレフィックスを外した名前が実際のファイル名です。迷ったら上記の構成表を参照してください。
- **管理対象外のファイルは `.chezmoiignore` に明示的に追記してください。**
  chezmoi はプレフィックスなしのファイルを自動で無視しますが、意図を明確にするために `.chezmoiignore` へも記載します。

---

## 動作環境

- **OS:** macOS (Apple Silicon / arm64)
- **Shell:** zsh（メイン）、bash（サブシェル・スクリプト用）
- **前提ツール:** Homebrew（`/opt/homebrew`）、Bun
