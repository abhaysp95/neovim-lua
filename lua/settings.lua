-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-- check :h nvim-default (for defaults from nvim)

-- neovim general settings

-- aliases

local cmd = vim.cmd
-- local exec = vim.api.nvim_exec
local fn = vim.fn
-- local g = vim.g
local set = vim.opt

-- general
set.clipboard = { 'unnamed', 'unnamedplus' } -- copy/paste to system clipboard

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
set.completeopt = { 'menuone', 'noinsert', 'noselect', 'longest', 'preview' }


set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.list = false
set.listchars = {
  tab = '│·',
  nbsp = '⦸',
  extends = '»',
  precedes = '«',
  trail = '•',
  eol = '¬'
}

set.linebreak = true     -- not working ?
if fn.has('linebreak') == 1 then
  set.showbreak = '↳'      -- put this in if block if linebreak is enabled(after above is fixed)
end

set.sidescroll = 0       -- smooth horizontal scrolling
set.sidescrolloff = 3    -- scroll starts when
set.startofline = true   -- move to first non-blank of line (few keys)
set.autowrite = true     -- svae files before switching buffer
set.omnifunc = 'syntaxcomplete#Complete'

set.ruler = true         -- show line and column number of cursor position
set.title = true         -- title of window will be set to value of 'titlestring'
set.hlsearch = true      -- highlight search
set.ignorecase = true    -- ignore case when searching
set.smartcase = true     -- smart case use
set.incsearch = true     -- incremental search
set.lazyredraw = true    -- don't redraw screen when executing macros, registers and other commands
set.matchpairs:append('<:>')  -- add extra matchpair

set.mmp = 10000          -- max amount of memory(in Kb) used in pattern matching
set.timeoutlen = 400     -- time (in milisec) to wait for mapping
set.modelines = 5        -- scan this many lines looking for modeline
set.shiftround = false   -- don't round indent to multiple of shiftwidth
set.spell = false
set.conceallevel = 2    -- concealed text is completely hiden unless replecement available
set.showcmd = true   -- show (partial) command in the last line of screen
set.showmatch = true  -- show match for pair
set.showmode = false  -- don't show mode chaging

set.shortmess:append('tc')
set.spelllang = { 'en_US', 'ja_JP', 'hi_IN' }  -- spellcheck for following languages

set.mouse = 'a'
set.undodir = '/tmp'
set.undofile = true
set.virtualedit = 'block'  -- cursor can be positioned where there is no actual character
set.whichwrap:append('<,>')
set.joinspaces = false  -- don't inserat two spaces after a '.', '?' and '!' with a join command
set.modeline = true
set.modelines = 4


-- better window managing
set.splitbelow = true
set.splitright = true

set.wildmenu = true
set.signcolumn = 'auto'
set.path:append('**')

set.formatoptions:remove('cro')
set.formatoptions:append('n')

set.foldenable = false
set.foldlevel = 1
set.foldlevelstart = 1
set.foldnestmax = 3
set.foldmethod = 'indent'

set.fillchars = {
  vert = '┃',
  fold = '∙',
  diff = '∙'
}

-- finish this function after knowing vim-regexp
-- set.foldtext = function()
--   local line = vim.api.nvim_get_vvar('foldstart')
--   print(vim.inspect(line))
-- end

-- settings when switching modes
cmd [[
  augroup highlight-when-switching-modes
  	autocmd!
  	autocmd InsertEnter * setlocal number norelativenumber nocursorline
  	autocmd InsertLeave * setlocal number relativenumber  " put "cursorline" here(if you want)
  augroup end
]]

-- periodically check for file changes
cmd [[
  augroup checktime
    autocmd!
    autocmd CursorHold * silent! checktime
  augroup end
]]

-- resize splits when vim changes size
cmd [[
  augroup auto-resize
    autocmd!
    autocmd VimResized * wincmd =
  augroup end
]]

cmd [[
  let @+=@"
  let @*=@""
]]
