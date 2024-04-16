return {
	-- {
	-- 	"nvim-telescope/telescope-ui-select.nvim",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = function(opts)
							return { "--hidden" }
						end,
					},
				},
			})
			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("undo")
		end,
	},
}
