local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,  -- make this false
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true, }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	keymap(bufnr, "n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	keymap(bufnr, "n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	keymap(bufnr, "n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap(bufnr, "n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gs", "<cmd>lua vim.diagnostic.show()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	keymap(bufnr, "n", "<Leader>gq", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
	keymap(bufnr, "n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_cmp_ok then
		print "failed: status_cmp_ok"
		return
	end

	lsp_keymaps(bufnr)
	--[[ local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		print "failed: status_ok illuminate"
		return
	end ]]
	-- illuminate.on_attach(client)
	--[[ illuminate.setup( {
		Illuminate_delay = 10,
		Illuminate_ftblacklist = {'nerdtree', 'markdown'},
	}) ]]

	if client.name == "rust_analyzer" then
		require('rust-tools').setup({
			tools = { -- rust-tools options

			-- how to execute terminal commands
			-- options right now: termopen / quickfix
			executor = require("rust-tools.executors").termopen,

			-- callback to execute once rust-analyzer is done initializing the workspace
			-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
			on_initialized = nil,

			-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
			reload_workspace_from_cargo_toml = true,

			-- These apply to the default RustSetInlayHints command
			inlay_hints = {
				-- automatically set inlay hints (type hints)
				-- default: true
				auto = true,

				-- Only show inlay hints for the current line
				only_current_line = false,

				-- whether to show parameter hints with the inlay hints or not
				-- default: true
				show_parameter_hints = true,

				-- prefix for parameter hints
				-- default: "<-"
				parameter_hints_prefix = "<- ",

				-- prefix for all the other hints (type, chaining)
				-- default: "=>"
				other_hints_prefix = "=> ",

				-- whether to align to the length of the longest line in the file
				max_len_align = false,

				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,

				-- whether to align to the extreme right or not
				right_align = false,

				-- padding from the right if right_align is true
				right_align_padding = 7,

				-- The color of the hints
				highlight = "Comment",
			},

			-- options same as lsp hover / vim.lsp.util.open_floating_preview()
			hover_actions = {

				-- the border that is used for the hover window
				-- see vim.api.nvim_open_win()
				--[[ border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				}, ]]

				-- Maximal width of the hover window. Nil means no max.
				max_width = nil,

				-- Maximal height of the hover window. Nil means no max.
				max_height = nil,

				-- whether the hover action window gets automatically focused
				-- default: false
				auto_focus = false,
			},

			-- settings for showing the crate graph based on graphviz and the dot
			-- command
			crate_graph = {
				-- Backend used for displaying the graph
				-- see: https://graphviz.org/docs/outputs/
				-- default: x11
				backend = "x11",
				-- where to store the output, nil for no output stored (relative
				-- path from pwd)
				-- default: nil
				output = nil,
				-- true for all crates.io and external crates, false only the local
				-- crates
				-- default: true
				full = true,

				-- List of backends found on: https://graphviz.org/docs/outputs/
				-- Is used for input validation and autocompletion
				-- Last updated: 2021-08-26
				enabled_graphviz_backends = { "bmp", "cgimage", "canon", "dot", "gv", "xdot", "xdot1.2", "xdot1.4", "eps",
					"exr", "fig", "gd", "gd2", "gif", "gtk", "ico", "cmap", "ismap", "imap", "cmapx", "imap_np", "cmapx_np", "jpg",
					"jpeg", "jpe", "jp2", "json", "json0", "dot_json", "xdot_json", "pdf", "pic", "pct", "pict", "plain", "plain-ext",
					"png", "pov", "ps", "ps2", "psd", "sgi", "svg", "svgz", "tga", "tiff", "tif", "tk", "vml", "vmlz", "wbmp",
					"webp", "xlib", "x11",
				},
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
		server = {
			-- standalone file support
			-- setting it to false may improve startup time
			standalone = true,
		}, -- rust-analyzer options

		-- debugging stuff
		dap = {
			adapter = {
				type = "executable",
				command = "lldb-vscode",
				name = "rt_lldb",
			},
		},
	})
	client.settings = {
		checkOnSave = {
			command = 'clippy',
		},
	}
end

	if client.name == "jdt.ls" then
		-- vim.lsp.codelens.refresh()  -- not sure if I need it (tells references)
		if JAVA_DAP_ACTIVE then
			require("jdtls").setup_dap{ hotcodereplace = "auto" }
			require("jdtls.dap").setup_dap_main_class_configs()
		end
		client.resolved_capabilites.document_formatting = false
		client.resolved_capabilites.textDocument.completion.completionItem.snippetSupport = false
	end

	-- there are some more supports (check old config if needed)
	M.capabilites = vim.lsp.protocol.make_client_capabilities()
	M.capabilites.textDocument.completion.completionItem.snippetSupport = true
	M.capabilites = cmp_nvim_lsp.default_capabilities(M.capabilites)

end

return M
