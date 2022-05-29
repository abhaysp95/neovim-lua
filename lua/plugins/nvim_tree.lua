--
--                  ▀                    ▄
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄         ▄▄█▄▄   ▄ ▄▄   ▄▄▄    ▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █           █     █▀  ▀ █▀  █  █▀  █
--  █   █   █▄█     █    █ █ █   ▀▀▀     █     █     █▀▀▀▀  █▀▀▀▀
--  █   █    █    ▄▄█▄▄  █ █ █           ▀▄▄   █     ▀█▄▄▀  ▀█▄▄▀
--
--  => lua/plugins/nvim_tree.lua

vim.g.hijack_netrw = 1
vim.g.nvim_tree_width_allow_resize  = 1
local status_ok, nvim_tree_config = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree_config.setup {
	open_on_setup = false,
	update_cwd = true,
	-- auto_close = true,  -- I'll update this after testing
	actions = {
		open_file = {
			window_picker = {
				enable = true,
				exclude = {
					filetype = {
						'packer',
					},
					buftype = {
						'terminal',
					},
				},
			},
			quit_on_open = false,
		},
	},
	filters = {
		dotfiles = true,
		custom = { '.git', 'node_modules', '.cache', '.bin' },
	},
	git = {
		enable = true,
		ignore = true,
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "all",
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {"‣ "},
		},
	},
	view = {
		width = 28,
		auto_resize = true
	},
	respect_buf_cwd = true,
}
