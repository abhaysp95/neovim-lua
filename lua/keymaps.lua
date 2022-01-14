local default_opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten the function name
local keybind = vim.api.nvim_set_keymap

-- setup for leader key
keybind('', '<Space>', '<NOP>', default_opts)
vim.g.mapleader = " "
-- print(vim.inspect(vim.g.mapleader))

-- setup for localleader key
keybind('', '\\', '<NOP>', default_opts)
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- reset search highlight
keybind('n', '<M-;>', ':nohlsearch<CR>', default_opts)

-- starting with "<Leader>i"
-- for list chars
keybind('n', '<Leader>il', ':setlocal list!<CR>:setlocal list?<CR>', default_opts)

-- starting with "<Leader>r"
-- replacement of words
-- press * then press a mapping below to replace all instances
keybind('n', '<Leader>ro', ':s///g<Left><Left>', default_opts)
