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

-- ayu-colorscheme
vim.g.ayucolor = 'dark'

-- srcery
vim.g.srcery_bold = 1
vim.g.srcery_italic = 1
vim.g.srcery_italic_types = 1

-- gruvbox-material
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_palette = 'material'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_visual = 'green background'
vim.g.gruvbox_material_menu_selection_background = 'green'
vim.g.gruvbox_material_sign_column_background = 'none'
vim.g.gruvbox_material_current_word = 'underline'
vim.g.gruvbox_material_statusline_style = 'original'
vim.g.gruvbox_material_better_performance = 1

-- tender
vim.g.tender_italics = 1
vim.g.tender_bold = 1

-- chuling/equinusocio_material
vim.g.equinusocio_material_style = 'pure'
vim.g.equinusocio_material_less = 50
vim.g.equinusocio_material_hide_vertsplit = 1
vim.g.equinusocio_material_bracket_improved = 0

-- xcodedarkhc (use xcode<variant> to setup, dark, darkhc, light, lighthc, wwdc available)
vim.g.xcodedarkhc_green_comments = 1
vim.g.xcodedarkhc_emph_types = 1
vim.g.xcodedarkhc_emph_funcs = 1
vim.g.xcodedarkhc_emph_indents = 1
vim.g.xcodedarkhc_match_paren_style = 0
vim.g.xcodedarkhc_dim_punctuation = 1

-- tokyonight
vim.g.tokyonight_style = "storm"                          -- night, storm
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions  = false
vim.g.tokyonight_italic_variables  = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline  = false
vim.g.tokyonight_sidebars  = {}                           -- ["qf", "vista_kind", "terminal", "packer"]
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_sidebar  = true
vim.g.tokyonight_dark_float  = true
vim.g.tokyonight_colors  = {}                             -- table (with key, value pairs)
vim.g.tokyonight_day_brightness  = 0.3
-- vim.g.tokyonight_lualine_bold  = false

vim.cmd [[ colorscheme tokyonight ]]

-- using background of terminal (generated from pywal)
-- vim.cmd [[ au Colorscheme * hi Normal ctermbg=none guibg=none ]]
-- vim.cmd [[ hi Normal ctermbg=none guibg=none ]]


-- no background setttings
vim.api.nvim_exec([[
  hi Normal ctermbg=none guibg=none
  hi NormalFloat ctermbg=none guibg=none
  hi NormalNC ctermbg=none guibg=none
]], true)

vim.api.nvim_exec([[
  hi LineNr guibg=background
  hi CursorLineNr guibg=background
  hi DiffAdd  guibg=background
  hi DiffChange  guibg=background
  hi DiffDelete  guibg=background
  hi SignifySignAdd guibg=background
  hi SignifySignChange guibg=background
  hi SignifySignDelete guibg=background
  hi SignColumn guibg=background
  hi FoldColumn guibg=background
]], true)

