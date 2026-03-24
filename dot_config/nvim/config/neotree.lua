require("neo-tree").setup({
  git_status = {
    window = {
      -- 表示幅
      width = 30,
      -- ツリーの表示位置
      position = "right",
    },
  },

  filesystem = {
    window = {
      -- 表示幅
      width = 30,
      -- ツリーの表示位置
      position = "left",
    },
    -- ファイルの変更を検知してツリーに反映
    use_libuv_file_watcher = true,
    follow_current_file = {
      -- 現在のファイルを自動的にフォーカス/展開
      enabled = true,
      leave_dirs_open = false,
    },
    -- 非表示ファイルの制御
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignore = false,
      hide_by_name = {
        ".DS_Store",
        ".git",
        "thumbs.db",
        "node_modules",
        "__pycache__",
      },
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = "+",
        deleted   = "x",
        modified  = "M",
        renamed   = "R",
        -- Status type
        untracked = "?",
        ignored   = "",
        unstaged  = "",
        staged    = "S",
        conflict  = "",
      }
    }
  }
})

-- NVIMを開いた場合にNeo-treeを表示
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ source = "filesystem", action = 'focus'})
  end,
})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle<CR>')
vim.keymap.set('n', '<C-g>', ':Neotree git_status toggle<CR>')
