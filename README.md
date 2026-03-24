# dotfiles

---

## 前提条件

- macOS (Apple Silicon / arm64)
- `git`, `curl`

---

## 初期導入手順

### 1. chezmoi のインストール & dotfiles の適用

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:IsodaZen/dotfiles.git
```

### 2. ファイルの適用

```sh
chezmoi apply
```

ファイルの追加、Homebrewやその他のツールがインストールされる

---

## 管理されている設定ファイル

| ソースファイル | 展開先 | 概要 |
| -------------- | ------ | ---- |
| `dot_zshrc` | `~/.zshrc` | zsh メイン設定 |
| `dot_zsh/conf/set-prompt.conf` | `~/.zsh/conf/set-prompt.conf` | プロンプト・chpwd フック |
| `dot_zsh/conf/key-binding.conf` | `~/.zsh/conf/key-binding.conf` | bash conf の読み込み |
| `dot_bashrc` | `~/.bashrc` | 共通エイリアス・PATH・履歴設定 |
| `dot_bash_profile` | `~/.bash_profile` | `.bashrc` を source するだけ |
| `dot_bash/conf/homebrew.conf` | `~/.bash/conf/homebrew.conf` | Homebrew PATH 初期化 |
| `dot_bash/conf/bun.conf` | `~/.bash/conf/bun.conf` | Bun PATH・補完設定 |
| `dot_gitconfig` | `~/.gitconfig` | Git ユーザー・エイリアス設定 |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim 設定（init.vim, dein.toml, config/） |
| `dot_config/wezterm/wezterm.lua` | `~/.config/wezterm/wezterm.lua` | WezTerm 設定 |
| `empty_dot_zprofile` | `~/.zprofile` | 空ファイル（zsh 用） |

> **chezmoi の命名規則:** `dot_` プレフィックスは `.` に展開されます。
> 例: `dot_zshrc` → `~/.zshrc`

---

## 日常的なワークフロー

```sh
# ソースファイルの変更をホームディレクトリに反映
chezmoi apply

# ソースと実ファイルの差分を確認
chezmoi diff

# ソースファイルを直接編集して apply
chezmoi edit ~/.zshrc

# 実ファイルへの変更をソースに取り込む
chezmoi re-add ~/.zshrc
```

---

## 新しいツール設定を追加する手順

`~/.bash/conf/` または `~/.zsh/conf/` に配置した `.conf` ファイルは、シェル起動時に自動で読み込まれます。

```sh
# 1. 実ファイルとして作成・編集
vim ~/.bash/conf/foo.conf

# 2. chezmoi のソースに取り込む
chezmoi re-add ~/.bash/conf/foo.conf

# 3. コミット & プッシュ
cd ~/.local/share/chezmoi
git add dot_bash/conf/foo.conf
git commit -m "feat: add foo configuration"
git push
```

---

## 既存の設定を更新する手順

```sh
# 1. ソースファイルを編集（chezmoi edit が推奨）
chezmoi edit ~/.zshrc

# 2. ホームディレクトリに反映
chezmoi apply

# 3. コミット & プッシュ
cd ~/.local/share/chezmoi
git add dot_zshrc
git commit -m "fix: update zshrc"
git push
```
