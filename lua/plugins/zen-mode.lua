--
--                                                █
--  ▄▄▄▄▄   ▄▄▄   ▄ ▄▄          ▄▄▄▄▄   ▄▄▄    ▄▄▄█   ▄▄▄
--     ▄▀  █▀  █  █▀  █         █ █ █  █▀ ▀█  █▀ ▀█  █▀  █
--   ▄▀    █▀▀▀▀  █   █   ▀▀▀   █ █ █  █   █  █   █  █▀▀▀▀
--  █▄▄▄▄  ▀█▄▄▀  █   █         █ █ █  ▀█▄█▀  ▀█▄██  ▀█▄▄▀
--
--  => lua/plugins/zen-mode.lua

local status_ok, zen_config = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_config.setup {
  window = {
    backdrop = 0.95,
    width = 100,
    height = 0.8,
    options = {signcolumn = "yes", number = true, cursorline = true}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    twilight = {enabled = true},
    gitsigns = {enabled = true},
    tmux = {enabled = false}
  }
}
