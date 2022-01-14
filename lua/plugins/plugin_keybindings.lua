local default_opts = { noremap = true, silent = true }

-- short function alias
local keybind = vim.api.nvim_set_keymap

------------------------
-- vim-tmux-navigator --
------------------------
-- I'm already habitual to default bindings of plugin
keybind('n', '<C-h>', ':TmuxNavigateLeft<CR>', default_opts)
keybind('n', '<C-j>', ':TmuxNavigateDown<CR>', default_opts)
keybind('n', '<C-k>', ':TmuxNavigateUp<CR>', default_opts)
keybind('n', '<C-l>', ':TmuxNavigateRight<CR>', default_opts)
keybind('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', default_opts)
