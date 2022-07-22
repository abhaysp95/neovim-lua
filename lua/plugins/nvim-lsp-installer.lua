--
--  ▀▀█                           ▀                    ▄           ▀▀█    ▀▀█
--    █     ▄▄▄   ▄▄▄▄          ▄▄▄    ▄ ▄▄    ▄▄▄   ▄▄█▄▄   ▄▄▄     █      █     ▄▄▄    ▄ ▄▄
--    █    █   ▀  █▀ ▀█           █    █▀  █  █   ▀    █    ▀   █    █      █    █▀  █   █▀  ▀
--    █     ▀▀▀▄  █   █           █    █   █   ▀▀▀▄    █    ▄▀▀▀█    █      █    █▀▀▀▀   █
--    ▀▄▄  ▀▄▄▄▀  ██▄█▀         ▄▄█▄▄  █   █  ▀▄▄▄▀    ▀▄▄  ▀▄▄▀█    ▀▄▄    ▀▄▄  ▀█▄▄▀   █
--                █
--                ▀     ▀▀▀▀▀▀
--
-- ==> lua/plugins/nvim_lsp_installer.lua
--

local status_ok, nli = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

nli.setup {
	ensure_installed = {},
	automatic_installation = true,
	ui = {
		check_outdated_servers_on_open = false,
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
		--[[ keymaps {
			-- toggle_server_expand = "<CR>",
			-- install_server,
			-- update_server
			-- check_server_version
			-- update_all_server
			-- check_outdated_server
			-- uninstall_server
		} ]]
	},
	install_root_dir = path.concat{ vim.fn.stdpath "data", "lsp_servers" },
	pip = {
		install_args = {},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
	--[[ github = {
		download_url_template
	}, ]]
}
