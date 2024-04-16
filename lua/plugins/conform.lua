return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadpre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				sh = { "shfmt" },
				c = { "clang-format" },
				html = { "djlint" },
				typescript = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				vue = { "prettierd" },
				markdown = { "prettierd" },
				docker = { "prettierd" },
				solidity = { "solhint" },
				go = { "gofumpt" },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
        assembly = { "asmfmt" },
			},
			-- If this is set, Conform will run the formatter on save.
			-- It will pass the table to conform.format().
			-- This can also be a function that returns the table.
			-- format_after_save = {
			-- 	-- I recommend these options. See :help conform.format for details.
			-- 	lsp_fallback = true,
			-- 	timeout_ms = 500,
			-- },
			-- vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			-- 	require("conform").format({
			-- 		lsp_fallback = true,
			-- 		async = false,
			-- 		timeout_ms = 500,
			-- 	})
			-- end, { desc = "Format" }),
		},
	},
}
