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
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		print "failed: status_ok illuminate"
		return
	end
	illuminate.on_attach(client)
	--[[ illuminate.setup( {
		Illuminate_delay = 10,
		Illuminate_ftblacklist = {'nerdtree', 'markdown'},
	}) ]]

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
	M.capabilites = cmp_nvim_lsp.update_capabilities(M.capabilites)

end

return M
