--
--                ▀▀█
--   ▄▄▄    ▄▄▄     █     ▄▄▄    ▄ ▄▄   ▄▄▄
--  █▀  ▀  █▀ ▀█    █    █▀ ▀█   █▀  ▀ █   ▀
--  █      █   █    █    █   █   █      ▀▀▀▄
--  ▀█▄▄▀  ▀█▄█▀    ▀▄▄  ▀█▄█▀   █     ▀▄▄▄▀
--
--  => lua/colors.lua

vim.cmd [[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  hi SpellBad cterm=underline ctermfg=9
  hi SpellLocal cterm=underline ctermfg=9
  hi SpellRare cterm=underline ctermfg=9
  hi SpellCap cterm=underline
]]

if vim.fn.has('nvim') == 1 then
  vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

vim.opt.background = 'dark'

-- require colorscheme settings
--[[ require ('colors.tokyonight')
require ('colors.ayu')
require ('colors.github')
require ('colors.gruvbox-material') ]]
require ('colors.gruvbox-baby')
require ('colors.zenbones')
require ('colors.everforest')
--[[ require ('colors.github')
require ('colors.material')
require ('colors.nightfox')
require ('colors.srcery')
require ('colors.tender')
require ('colors.xcode')
require ('colors.kanagawa')
require ('colors.moonfly')
require ('colors.nightfly')
require ('colors.catppuccin')
require ('colors.equinusocio_material') ]]

vim.cmd [[ colorscheme everforest ]]

-- using background of terminal (generated from pywal)
-- vim.cmd [[ au Colorscheme * hi Normal ctermbg=none guibg=none ]]
-- vim.cmd [[ hi Normal ctermbg=none guibg=none ]]


-- no background setttings
vim.api.nvim_exec([[
  hi Normal guibg=#182023
  hi NormalFloat ctermbg=none guibg=none
  hi NormalNC ctermbg=none guibg=none
  hi EndOfBuffer ctermbg=none guibg=none
  hi NvimTreeNormal ctermbg=none guibg=none
  hi NvimTreeNormalNC ctermbg=none guibg=none
  hi TelescopeNormal ctermbg=none guibg=none
  hi TelescopeBorder ctermbg=none guibg=none
  hi link FloatermBorder TelescopeBorder
]], true)
  -- hi Normal ctermbg=none guibg=none
  -- hi Normal ctermbg=5 guibg=#121212

-- some colorschemes don't support this
-- vim.cmd([[
--   exec 'hi NvimTreeVertSplit ctermbg=none guibg=none' .
--     \ ' guifg=' . synIDattr(synIDtrans(hlID('TelescopeBorder')), 'fg', 'gui')
--     " \ ' ctermfg=' . synIDattr(synIDtrans(hlID('TelescopeBorder')), 'fg', 'cterm')
-- ]])

vim.api.nvim_exec([[
  hi LineNr guibg=background
  hi CursorLineNr guibg=background
  hi DiffAdded gui=None ctermbg=0  guibg=background
  hi DiffChange gui=None ctermbg=0 guibg=background
  hi DiffDelete gui=None ctermbg=0 guibg=background
  hi SignifySignAdd guibg=background
  hi SignifySignChange guibg=background
  hi SignifySignDelete guibg=background
  hi SignColumn guibg=background
  hi FoldColumn guibg=background
]], true)

-- see the following link for colorschemes with nvim-treesitter support
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
