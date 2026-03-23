# chezmoi 命名規則

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
