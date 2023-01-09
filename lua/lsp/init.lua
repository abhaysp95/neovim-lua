--[[ require("lsp.lsp_installer")
require("lsp.handlers").setup() ]]


local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	"angularls",
	"clangd",
	"cmake",
	"cssls",
	"dotls",
	"emmet_ls",
	"gopls",
	"html",
	"kotlin_language_server",
	"pyright",
	"solc",
	"jdtls",
	"lemminx",
	"sumneko_lua",
	"rust_analyzer",
	"tsserver",
	"vuels"
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end
	vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.keymap.set("n", "<Leader>gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.keymap.set("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.keymap.set("n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	vim.keymap.set("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.keymap.set("n", "<Leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "<Leader>gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "<Leader>gf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ popu_opts = { border=\"single\" , focusable=false} })<CR>", opts)
	vim.keymap.set("n", "<Leader>gs", "<cmd>lua vim.diagnostic.show()<CR>", opts)
	vim.keymap.set("n", "<Leader>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.keymap.set("n", "<Leader>gq", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
	vim.keymap.set("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  --[[ vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts) ]]
end)

lsp.setup()

--[[ local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga() ]]

vim.diagnostic.config({
    virtual_text = true,
})
