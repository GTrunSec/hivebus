-- local wezterm = require 'catppuccin'
config = {
   default_prog = { '/run/current-system/etc/profiles/per-user/' .. os.getenv("USER") .. '/bin/nu', '-l' },
   window_background_opacity = 0.8,
   font_size = 20.0,
}
return config
-- config.keys = {
--   -- Shift + Control + R to rename tab
--   {
--     key = "R",
--     mods = "SHIFT|CTRL",
--     action = act.PromptInputLine({
--       description = "Enter new name for tab",
--       action = wezterm.action_callback(function(window, pane, line)
--         -- line will be `nil` if they hit escape without entering anything
--         -- An empty string if they just hit enter
--         -- Or the actual line of text they wrote
--         if line then
--           window:active_tab():set_title(line)
--         end
--       end),
--     }),
--   },
-- }
