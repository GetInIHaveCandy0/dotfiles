return {
	{
		"ptdewey/yankbank-nvim",
		event = "VeryLazy",
		config = function()
			require("yankbank").setup({
				max_entries = 5,
				sep = "|--------------->--------------->---------------|",
				num_behavior = "jump",
			})
		end,
	},
}
