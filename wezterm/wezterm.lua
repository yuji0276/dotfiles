-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.automatically_reload_config = true
-- For example, changing the initial geometry for new windows:

config.window_close_confirmation = 'NeverPrompt'
-- zellij の自動起動は無効化（通常のログインシェルで起動する）
-- 復活させる場合は下の行のコメントを外す
-- config.default_prog = { '/bin/zsh', '-l', '-c', 'exec "$HOME/.config/zellij/launch.sh"' }
config.default_prog = { '/bin/zsh', '-l' }
config.skip_close_confirmation_for_processes_named = {
  "zsh",
  "zellij",
}
-- フォント,カラースキーマなどの表示系
config.color_scheme = 'iceberg-dark'
config.enable_tab_bar = false
config.window_padding = {left=0,right=0,top=0,bottom=0}
config.font_size = 16
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'Hiragino Sans',       
  'Apple Color Emoji',  
}

-- Option キーを Alt 修飾として端末へ送る（zellij のモード切り替え用）
-- 既定では左 Option のみ Alt、右 Option は文字合成（˚ ¬ など）になるため両方を明示的に無効化する
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- CMD (Super) を端末アプリへ転送するために Kitty Keyboard Protocol を有効化する
-- zellij 側は support_kitty_keyboard_protocol が既定で true のため設定不要
config.enable_kitty_keyboard = true

-- zellij の操作コマンドに CMD を使うため、衝突する WezTerm/macOS 既定の割り当てを解除する
local act = wezterm.action
config.keys = {
  { key = "n", mods = "SUPER", action = act.DisableDefaultAssignment }, 
  { key = "w", mods = "SUPER", action = act.DisableDefaultAssignment }, 
  { key = "t", mods = "SUPER", action = act.DisableDefaultAssignment }, 
  { key = "h", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "f", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "k", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "+", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "-", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "=", mods = "SUPER", action = act.DisableDefaultAssignment },

  -- Cmd+1〜9 は WezTerm 既定で ActivateTab に割り当たっている。
  -- enable_tab_bar = false で見えないタブへ飛んでしまうため解除し、
  -- zellij 側の GoToTab に渡す。
  { key = "1", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "2", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "3", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "4", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "5", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "6", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "7", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "8", mods = "SUPER", action = act.DisableDefaultAssignment },
  { key = "9", mods = "SUPER", action = act.DisableDefaultAssignment },
}

config.window_decorations = "RESIZE"
-- Finally, return the configuration to wezterm:
return config
