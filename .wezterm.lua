-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local dimmer = { brightness = 0.1 }
-- This is where you actually apply your config choices
--

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.window_background_opacity = 0.5
config.audible_bell= "Disabled"
config.automatically_reload_config = true
config.animation_fps = 1
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.background = {
    {
    source = {
      File = '/Users/daiki.ito/Downloads/image04_o.jpeg',
    },

    opacity = 0.8,
    -- The texture tiles vertically but not horizontally.
    -- When we repeat it, mirror it so that it appears "more seamless".
    -- An alternative to this is to set `width = "100%"` and have
    -- it stretch across the display
    repeat_x = 'Mirror',
    hsb = dimmer,
    -- When the viewport scrolls, move this layer 10% of the number of
    -- pixels moved by the main viewport. This makes it appear to be
    -- further behind the text.
    attachment = { Parallax = 0.1 },
  }
}

config.colors = {
  scrollbar_thumb = 'white',
}
-- and finally, return the configuration to wezterm
return config


