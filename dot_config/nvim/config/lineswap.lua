-- 行の入れ替え（境界チェックあり）
local function swap_line_down()
  local current = vim.fn.line('.')
  local last = vim.fn.line('$')
  if current == last then return end
  vim.cmd('move +1')
end

local function swap_line_up()
  local current = vim.fn.line('.')
  if current == 1 then return end
  vim.cmd('move -2')
end

-- -- ビジュアルモードでの行入れ替え(現在正常動作せず)
-- local function swap_visual_down()
--   local first = vim.fn.line('v')
--   local last_line = vim.fn.line('$')
--   local vend = vim.fn.line('.')
--   local bottom = math.max(first, vend)
--   if bottom == last_line then return end
--   vim.cmd("'<,'>move '>+1")
-- end
--
-- local function swap_visual_up()
--   local first = vim.fn.line('v')
--   local vtop = math.min(first, vim.fn.line('.'))
--   if vtop == 1 then return end
--   vim.cmd("'<,'>move '<-2")
-- end

vim.keymap.set('n', '<C-J>', swap_line_down, { desc = 'Swap line down' })
vim.keymap.set('n', '<C-K>', swap_line_up,   { desc = 'Swap line up' })

-- vim.keymap.set('v', '<C-J>', swap_visual_down, { desc = 'Swap selection down' })
-- vim.keymap.set('v', '<C-K>', swap_visual_up,   { desc = 'Swap selection up' })

