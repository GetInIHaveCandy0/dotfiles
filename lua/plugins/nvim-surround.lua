return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				aliases = {
					["a"] = ">",
					["p"] = ")",
					["B"] = "}",
					["b"] = "]",
					["q"] = { '"', "'", "`" },
					["s"] = { "}", "]", ")", ">", '"', "'", "`" },
				},
				keymaps = {
					insert = "<C-g>s", -- same as ys but on insert mode
					insert_line = "<C-g>S", -- same as yS but on insert mode
					normal = "ys", -- Inserts surround on motion (ys{motion}{char})
					normal_cur = "yss", -- Inserts surround on whole line
					normal_line = "yS", -- Same as non-capital counterparts but add delimiter on new lines
					normal_cur_line = "ySS", -- Same as non-capital counterparts bnbut add delimiter on new lines
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs", -- cs{target}{replacement}
					change_line = "cS", -- Same as above but for whole line
				},
				highlight = {
					duration = 1,
				},
			})
		end,
	},
}
