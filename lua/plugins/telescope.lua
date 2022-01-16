local actions = require'telescope.actions'
-- Global remapping
require'telescope'.setup {
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
	},
}

vim.api.nvim_exec([[
  hi TelescopeNormal ctermbg=none guibg=none
  hi TelescopeBorder ctermbg=none guibg=none
]], true)
