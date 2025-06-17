local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"

config.window_frame = {
  inactive_titlebar_bg = "#0d1117",
  active_titlebar_bg = "#0d1117",
}

config.window_background_gradient = {
  colors = { "#0d1117" }, -- 暗い青系に
}

config.colors = {
  foreground = "#ffffff", -- テキストを白く
  background = "#0d1117", -- 背景を暗青で固定
  cursor_bg = "#00F0FF",  -- カーソル：蛍光ピンク
  cursor_fg = "#0d1117",
  selection_bg = "#00F0FF",
  selection_fg = "#0d1117",
  tab_bar = {
    background = "#0d1117",
    inactive_tab_edge = "#1a1f2c",
    active_tab = {
      bg_color = "#ff4081",   -- アクティブタブ背景：ピンク
      fg_color = "#0d1117",   -- アクティブタブ文字：黒っぽく
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1a1f2c",   -- 非アクティブタブ：暗青
      fg_color = "#cccccc",
    },
    inactive_tab_hover = {
      bg_color = "#2a2f3c",
      fg_color = "#ffffff",
    },
    new_tab = {
      bg_color = "#0d1117",
      fg_color = "#ffffff",
    },
    new_tab_hover = {
      bg_color = "#ff4081",
      fg_color = "#0d1117",
    },
  },
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#1a1f2c"      -- 通常タブの背景：暗青
  local foreground = "#ffffff"      -- 通常タブの文字：白
  local edge_background = "#0d1117" -- 外枠：暗背景

  if tab.is_active then
    background = "#ff4081"          -- アクティブ：蛍光ピンク
    foreground = "#0d1117"          -- アクティブ文字：暗青で映えるように
  end

  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width -1) .. "   "

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return config
