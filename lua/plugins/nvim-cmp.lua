--
--                  ▀
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄          ▄▄▄   ▄▄▄▄▄  ▄▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █         █▀  ▀  █ █ █  █▀ ▀█
--  █   █   █▄█     █    █ █ █   ▀▀▀   █      █ █ █  █   █
--  █   █    █    ▄▄█▄▄  █ █ █         ▀█▄▄▀  █ █ █  ██▄█▀
--                                                   █
--                                                   ▀
--  => lua/plugins/nvim-cmp.lua

-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmpa


local status1_ok, cmp = pcall(require, 'cmp')
local status2_ok, luasnip = pcall(require, 'luasnip')
if not status1_ok or not status2_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load({paths = {
	"~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
}})

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}




cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

    -- completion settings
    completion = {
    	--completeopt = 'menu,menuone,noselect'
    	keyword_length = 2
    },

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
 		['<CR>'] = cmp.mapping.confirm {
 			behavior = cmp.ConfirmBehavior.Replace,
 			select = false,
 		},
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	--[[ window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	}, ]]
	experimental = {
		ghost_text = false,
	},
})






-------------
-- lspkind --
-------------

-- local lspkind = require('lspkind')
-- cmp.setup {
-- 	formatting = {
-- 		format = lspkind.cmp_format({
-- 			with_text = false, -- do not show text alongside icons
-- 			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--
-- 			-- The function below will be called before any actual modifications from lspkind
-- 			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
-- 			before = function (entry, vim_item)
-- 				-- ...
-- 				return vim_item
-- 			end
-- 		})
-- 	}
-- }



-- cmp.setup({
-- 	-- load snippet support
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
--
-- 	-- completion settings
-- 	completion = {
-- 		--completeopt = 'menu,menuone,noselect'
-- 		keyword_length = 2
-- 	},
--
-- 	-- key mapping
-- 	mapping = cmp.mapping.preset.insert({
-- 		['<C-n>'] = cmp.mapping.select_next_item(),
-- 		['<C-p>'] = cmp.mapping.select_prev_item(),
-- 		--[[ ['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-f>'] = cmp.mapping.scroll_docs(4), ]]
-- 		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
-- 		['<C-m>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
-- 		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 		['<C-e>'] = cmp.mapping({
-- 			i = cmp.mapping.abort(),
-- 			c = cmp.mapping.close(),
-- 		}),
-- 		['<CR>'] = cmp.mapping.confirm {
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = false,
-- 		},
--
-- 		-- Tab mapping
-- 		["<Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_next_item()
-- 			elseif luasnip.expandable() then
-- 				luasnip.expand()
-- 			elseif luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			elseif check_backspace() then
-- 				fallback()
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 		"i",
-- 		"s",
-- 	}),
--
-- 	['<S-Tab>'] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_prev_item()
-- 		elseif luasnip.jumpable(-1) then
-- 			luasnip.jump(-1)
-- 		else
-- 			fallback()
-- 		end
-- 	end, {
-- 		"i",
-- 		"s",
-- 	}),
-- 	})
--
-- 	-- load sources, see: https://github.com/topics/nvim-cmp
-- 	sources = {
-- 		{ name = 'nvim_lsp' },
-- 		{ name = 'luasnip' },
-- 		{ name = 'path' },
-- 		{ name = 'buffer' },
-- 	},
-- })
--


