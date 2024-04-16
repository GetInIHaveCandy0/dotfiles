return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"lua",
					"python",
					"c",
				},
				auto_install = true,
				highlight = { enable = true, additional_vim_regex_highlighting = true },
				indent = { enable = true },
				autotag = { enable = true },

				vim.filetype.add({
					extension = { rasi = "rasi" },
					pattern = {
						[".*/waybar/config"] = "jsonc",
						[".*/mako/config"] = "dosini",
						[".*/kitty/*.conf"] = "bash",
						[".*/hypr/.*%.conf"] = "hyprlang",
					},
				}),
			})
		end,
	},
}
