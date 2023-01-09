local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.ensure_installed({
	"angularls",
	"clangd",
	"cmake",
	"cssls",
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
