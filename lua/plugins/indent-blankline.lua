--
--
--   ▀               █                  ▄           █      ▀▀█                  █      ▀▀█      ▀
-- ▄▄▄    ▄ ▄▄    ▄▄▄█   ▄▄▄   ▄ ▄▄   ▄▄█▄▄         █▄▄▄     █     ▄▄▄   ▄ ▄▄   █   ▄    █    ▄▄▄    ▄ ▄▄    ▄▄▄
--   █    █▀  █  █▀ ▀█  █▀  █  █▀  █    █           █▀ ▀█    █    ▀   █  █▀  █  █ ▄▀     █      █    █▀  █  █▀  █
--   █    █   █  █   █  █▀▀▀▀  █   █    █     ▀▀▀   █   █    █    ▄▀▀▀█  █   █  █▀█      █      █    █   █  █▀▀▀▀
-- ▄▄█▄▄  █   █  ▀█▄██  ▀█▄▄▀  █   █    ▀▄▄         ██▄█▀    ▀▄▄  ▀▄▄▀█  █   █  █  ▀▄    ▀▄▄  ▄▄█▄▄  █   █  ▀█▄▄▀
--
--
-- => lua/plugins/indent-blankline.lua


-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------


local status_ok, config = pcall(require, "indent_blankline")
if not status_ok then
  return
end

config.setup {
  char = "│",
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer'
  },
  buftype_exclude = {
    'terminal',
    'nofile'
  },
}

