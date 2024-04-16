return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				-- For snippets not included in base, see
				-- https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
				-- given example: `require'luasnip'.filetype_extend("ruby", {"rails"})`
			end,
		},
	},
}
