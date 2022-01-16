--
--
--         ▀▀█                    ▀                  █        ▀               █    ▀
--  ▄▄▄▄     █    ▄   ▄   ▄▄▄▄  ▄▄▄    ▄ ▄▄          █▄▄▄   ▄▄▄    ▄ ▄▄    ▄▄▄█  ▄▄▄    ▄ ▄▄    ▄▄▄▄   ▄▄▄
--  █▀ ▀█    █    █   █  █▀ ▀█    █    █▀  █         █▀ ▀█    █    █▀  █  █▀ ▀█    █    █▀  █  █▀ ▀█  █   ▀
--  █   █    █    █   █  █   █    █    █   █   ▀▀▀   █   █    █    █   █  █   █    █    █   █  █   █   ▀▀▀▄
--  ██▄█▀    ▀▄▄  ▀▄▄▀█  ▀█▄▀█  ▄▄█▄▄  █   █         ██▄█▀  ▄▄█▄▄  █   █  ▀█▄██  ▄▄█▄▄  █   █  ▀█▄▀█  ▀▄▄▄▀
--  █                     ▄  █                                                                  ▄  █
--  ▀                      ▀▀                                                                    ▀▀
--
--  => lua/plugins/plugin_keybindings.lua


-- NOTE: <Leader> is behaving for <Localleader>, figure out the issue

local default_opts = { noremap = true, silent = true }

-- short function alias
local keybind = vim.api.nvim_set_keymap

------------------------
-- vim-tmux-navigator --
------------------------
-- I'm already habitual to default bindings of plugin
keybind('n' , '<C-h>'  , ':TmuxNavigateLeft<CR>'     , default_opts)
keybind('n' , '<C-j>'  , ':TmuxNavigateDown<CR>'     , default_opts)
keybind('n' , '<C-k>'  , ':TmuxNavigateUp<CR>'       , default_opts)
keybind('n' , '<C-l>'  , ':TmuxNavigateRight<CR>'    , default_opts)
keybind('n' , '<C-\\>' , ':TmuxNavigatePrevious<CR>' , default_opts)

---------------
-- nvim_tree --
---------------
keybind('n' , '<C-n>'      , ':NvimTreeToggle<CR>'   , default_opts)
keybind('n' , '<Space>nr' , ':NvimTreeRefresh<CR>'  , default_opts)
keybind('n' , '<Space>nf' , ':NvimTreeFindFile<CR>' , default_opts)


--------------------
-- nvim-telescope --
--------------------
keybind('n', '<Localleader>r', ':Telescope live_grep<CR>', default_opts)
keybind('n', '<Leader>ts', [[:lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>]], default_opts)
keybind('n', '<Space>tg', [[:lua require('telescope.builtin').git_files()<CR>]], default_opts)
keybind('n', '<Space>tf', [[:lua require('telescope.builtin').find_files()<CR>]], default_opts)
keybind('n', '<Space>tg', [[:lua require('telescope.builtin').git_files()<CR>]], default_opts)
keybind('n', '<Space>tr', [[:lua require('telescope.builtin').live_grep()<CR>]], default_opts)
keybind('n', '<Space>tw', [[:lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], default_opts)
keybind('n', '<Space>tb', [[:lua require('telescope.builtin').buffers()<CR>]], default_opts)
keybind('n', '<Space>th', [[:lua require('telescope.builtin').help_tags()<CR>]], default_opts)
keybind('n', '<Space>tc', [[:lua require('telescope.builtin').colorscheme()<CR>]], default_opts)
keybind('n', '<Space>trc', [[:lua require('plugin-settings.telescope').search_dotfiles()<CR>]], default_opts)
keybind('n', '<Space>tG', [[:lua require('plugin-settings.telescope').git_branches()<CR>]], default_opts)


-------------
-- lspsaga --
-------------
keybind('n' , '<Space>gJ' , ':Lspsaga diagnostic_jump_next<CR>', default_opts)
keybind('n' , 'K'          , ':Lspsaga hover_doc<CR>', default_opts)
keybind('i' , 'gk'         , ':Lspsaga signature_help<CR>', default_opts)
keybind('n' , '<Space>gh' , ':Lspsaga lsp_finder<CR>', default_opts)
keybind('n' , '<Space>ga' , ':Lspsaga code_action<CR>', default_opts)
keybind('v' , '<Space>ga' , ':<C-U>Lspsaga range_code_action<CR>', default_opts)
keybind('n' , '<C-f>'      , [[<cmd>lua require('lspsaga.action') .smart_scroll_with_saga(1) <CR>]], default_opts)
keybind('n' , '<C-b>'      , [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1) <CR>]], default_opts)
keybind('n' , '<Space>gr' , [[<cmd>lua require('lspsaga.rename').rename() <CR>]], default_opts)
keybind('n' , '<Space>gp' , [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], default_opts)
keybind('n' , '<Space>fl' , [[<cmd>lua require('lspsaga.floaterm').open_float_terminal() <CR>]], default_opts)
keybind('n' , '<Space>fz' , [[<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>]], default_opts)
keybind('t' , '<Space>fl' , [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]], default_opts)


-- <Leader> is not working for above bindings, but for below, it is. What's going on ?

--------------
-- floaterm --
--------------
vim.cmd("let g:floaterm_keymap_new = '<leader>tn'")
vim.cmd("let g:floaterm_keymap_toggle = '<leader>tl'")
keybind('n', '<Leader>tn', ':FloatermNew', default_opts)
keybind('n', '<Leader>tl', ':FloatermToggle', default_opts)

-- NOTE: keybindings for lspconfig are in lsp/init.lua
