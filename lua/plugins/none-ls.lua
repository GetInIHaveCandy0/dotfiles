return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cofig = function()
		local none = require("null-ls")
		none.setup({
			sources = {
        -- Lua
				none.builtins.completion.luasnip,
        none.builtins.formatting.stylua,
        -- Everything else
				none.builtins.diagnostics.alex,
				none.builtins.diagnostics.codespell,
        none.builtins.diagnostics.hadolint,
        none.builtins.diagnostics.solhint,
				none.builtins.diagnostics.djlint,
        none.builtins.formatting.prettierd,
        -- Shell
        none.builtins.diagnostics.shellcheck,
        none.builtins.formatting.shellharden,
        none.builtins.formatting.shfmt,
        -- Low level
        none.builtins.diagnostics.gccdiag,
        none.builtins.formatting.clang_format,
        none.builtins.formatting.zigfmt,
				none.builtins.formatting.rustfmt,
				none.builtins.formatting.asmfmt,
			},
      debug = true,
		})
	end,
}
