local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- フォント
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 12.0

-- カラースキーム
config.color_scheme = 'lovelace'

-- ベルを無効化
config.audible_bell = "Disabled"

-- ウィンドウ設定
config.window_padding = { left = 16, right = 8, top = 8, bottom = 8 }
config.window_background_opacity = 0.95

-- キーバインド
config.keys = {
  { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n") },
}

return config
