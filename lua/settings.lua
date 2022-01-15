-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-- neovim general settings

-- aliases

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- general
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menuone,preview,noselect'

