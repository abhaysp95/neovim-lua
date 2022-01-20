--
--                  ▀                    ▄
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄         ▄▄█▄▄   ▄ ▄▄   ▄▄▄    ▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █           █     █▀  ▀ █▀  █  █▀  █
--  █   █   █▄█     █    █ █ █   ▀▀▀     █     █     █▀▀▀▀  █▀▀▀▀
--  █   █    █    ▄▄█▄▄  █ █ █           ▀▄▄   █     ▀█▄▄▀  ▀█▄▄▀
--
--  => lua/plugins/nvim_tree.lua

vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_width_allow_resize  = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    'packer',
  },
  buftype = {
    'terminal',
  }
}

vim.g.nvim_tree_icons = {
	default = "‣ "
}

require('nvim-tree').setup {
  open_on_setup = false,
  update_cwd = true,
  auto_close = true,  -- I'll update this after testing
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
  view = {
    width = 28,
    auto_resize = true
  },
}
