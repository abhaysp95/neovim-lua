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
  endif

  hi SpellBad cterm=underline ctermfg=9
  hi SpellLocal cterm=underline ctermfg=9
  hi SpellRare cterm=underline ctermfg=9
  hi SpellCap cterm=underline
]]
-- set termguicolors

if vim.fn.has('nvim') == 1 then
  vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end

vim.opt.background = 'dark'

-- require colorscheme settings
require ('colors.gruvbox-baby')
require ('colors.zenbones')
require ('colors.everforest')
require ('colors.nightfox')

local function get_full_hl_by_name(group)
	local gui_hl = vim.api.nvim_get_hl_by_name(group, true)

	local cterm = vim.api.nvim_get_hl_by_name(group, false)
	local ctermfg, ctermbg = cterm.foreground, cterm.backgrond
	cterm.foreground, cterm.background = nil, nil

	return vim.tbl_extend('error', gui_hl, {
		ctermfg = ctermfg,
		ctermbg = ctermbg,
		cterm = cterm
	})
end

local function dump(t)
	if type(t) == 'table' then
		local s = '{'
		for k, v in pairs(t) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '[' ..k.. '] = ' .. dump(v) .. ','
		end
		return s .. '}'
	else
		return tostring(t)
	end
end

local function update_hl(group, vals)
	local new_vals = vim.tbl_extend('force', get_full_hl_by_name(group), vals)
	vim.api.nvim_set_hl(0, group, new_vals)
end

local function getHexColor(indec)
	return string.format('#%06x', indec)
end

--[[ update_hl("ErrorFloat", { bg = "none" })
update_hl("WarningFloat", { bg = "none" }) ]]
-- vim.api.nvim_set_hl(0, "WarningFloat", { bg = "none", fg =  getHexColor(vim.api.nvim_get_hl_by_name('WarningFloat', true).foreground)})

function MarkColors(color)
	color = color or "gruvbox-baby"
	vim.cmd.colorscheme(color)

	-- #282a2e, #191f26
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#191f26"  } )
	vim.api.nvim_set_hl(0, "Normal", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"  } )

	-- nvimtree bg
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none"  } )

	-- telescope
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none"  } )
	vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "none"  } )

	-- git diff
	vim.api.nvim_set_hl(0, "DiffAdded", { bg = "none" } )
	vim.api.nvim_set_hl(0, "DiffChange", { bg = "none" } )
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none" } )
	vim.api.nvim_set_hl(0, "SignifySignAdd", { bg = "none" } )
	vim.api.nvim_set_hl(0, "SignifySignChange", { bg = "none" } )
	vim.api.nvim_set_hl(0, "SignifySignDelete", { bg = "none" } )


	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" } )
	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" } )

	-- completion
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" } )

	-- lsp & diagnostics
	--[[ vim.api.nvim_set_hl(0, "HintFloat", { bg = "none" } )
	vim.api.nvim_set_hl(0, "InfoFloat", { bg = "none" } ) ]]
	vim.api.nvim_set_hl(0, "ErrorFloat", { bg = nil, fg = default } )

	--[[ vim.api.nvim_set_hl(0, "WarningFloat", { bg = "none", fg = 'fg' } ) ]]

end

MarkColors("everforest")

-- no background setttings
  -- hi Normal guibg=#182023
  -- hi Normal ctermbg=5 guibg=#121212

-- see the following link for colorschemes with nvim-treesitter support
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
