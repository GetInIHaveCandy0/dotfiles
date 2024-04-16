local opts = {
	auto_install = true,
	ensure_installed = {
		"efm",
		"lua_ls",
		"clangd",
		"pyright",
		"bashls",
		-- "gopls",
		"jsonls",
		"tsserver",
		"emmet_ls",
		"ruff_lsp",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	lazy = false,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
