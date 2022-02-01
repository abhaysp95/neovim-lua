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
  context_char = "│",
  disable_with_nolist = false,
  show_first_indent_level = true,
  show_current_context = true,
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'NvimTree',
    'TelescopePrompt',
    'TelescopeResults',
    'lsp-installer',
    'dashboard',
    'man',
    'godoc',
  },
  buftype_exclude = {
    'terminal',
    'nofile'
  },
}

