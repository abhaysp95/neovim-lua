-- if vim.api.nvim_get_vvar('loaded_nvim_treesitter') == nil then
--   print("Treesitter not loaded")
--   return
-- end

require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"go",
		"haskell",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"python",
		"rust",
		"ruby",
		"typescript"
	},
	incremental_selection = {
		enable = true,
		keymap = {
			init_selection = "gnn",
			node_incremental = "gnn",
			scope_incremental = "gnc",
			node_decremental = "gnd",
		},
	},
	-- nvim-ts-rainbow
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true,
	-- 	max_file_lines = nil,
	-- 	colors = {
  --     -- rose-pine
  --     '#111019',
  --     '#e0def4',
  --     '#eb6f92',
  --     '#9ccfd8',
  --     '#31748f',
  --     '#f6c177',
  --     '#2a2837',
  --     '#c4a7e7',
  --     '#ebbcba',
	-- 	},  -- table of hex strings
	-- 	-- termcolors = {}, -- table of colour name strings
	-- },
}


vim.api.nvim_exec([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	]], true)

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
