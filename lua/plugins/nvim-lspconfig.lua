local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
					venvPath = "~/.virtualenvs/debugpy",
				},
			},
		},
	})

	-- Python #2
	lspconfig.ruff_lsp.setup({
		init_options = {
			settings = {
				args = {},
			},
		},
	})

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh" },
	})

	-- c
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		require("clangd_extensions.inlay_hints").setup_autocmd(),
		require("clangd_extensions.inlay_hints").set_inlay_hints(),
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

	-- zig
	lspconfig.zls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			enable_snippets = true,
		},
	})

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- assembly
	lspconfig.asm_lsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"asm",
			"s",
			"S",
		},
	})

	-- GO
	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
		},
	})

	-- solidity
	lspconfig.solidity.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "solidity" },
	})

	-- docker
	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- null-ls

	-- efmls
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local rufff = require("efmls-configs.formatters.ruff")
	local ruffl = require("efmls-configs.linters.ruff")
	local gcc = require("efmls-configs.linters.gcc")
	local clang_format = require("efmls-configs.formatters.clang_format")
	local golangci_lint = require("efmls-configs.linters.golangci_lint")
	local gofumpt = require("efmls-configs.formatters.gofumpt")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	local djlint = require("efmls-configs.linters.djlint")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local alex = require("efmls-configs.linters.alex")
	local hadolint = require("efmls-configs.linters.hadolint")
	local solhint = require("efmls-configs.linters.solhint")

	-- none-ls - see none-ls.lua_ls

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"sh",
			"c",
			"html",
			"json",
			"jsonc",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
			"markdown",
			"docker",
			"solidity",
			"go",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				-- python = { flake8, black },
				python = { ruffl, rufff, djlint },
				sh = { shellcheck, shfmt },
				c = { gcc, clang_format },
				html = { djlint, prettierd },
				typescript = { eslint_d, prettierd },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				javascript = { eslint_d, prettierd },
				javascriptreact = { eslint_d, prettierd },
				typescriptreact = { eslint_d, prettierd },
				svelte = { eslint_d, prettierd },
				vue = { eslint_d, prettierd },
				markdown = { alex, prettierd },
				docker = { hadolint, prettierd },
				solidity = { solhint },
				go = { golangci_lint, gofumpt },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf" },
		{ "folke/neodev.nvim", opts = {} },
		{ "windwp/nvim-autopairs" },
		{ "williamboman/mason.nvim" },
		{ "creativenull/efmls-configs-nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
}
