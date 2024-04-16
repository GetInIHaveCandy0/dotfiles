return {
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*", -- Use the latesed version
		event = "VeryLazy",
		opts = {}, -- This causes the plugin setup function to be called
		-- keys = {
		-- 	{ "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" }, desc = "add cursor down" },
		-- 	{ "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", desc = "add cursor down" },
		-- 	{ "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i" }, desc = "add cursor up" },
		-- 	{ "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i" }, desc = "add cursor up"},
		-- 	{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "add/delete cursor on mouse click" },
		-- 	{ "<Leader>ma", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" } },
		-- 	{ "<Leader>mA", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = { "n", "x" } },
		-- 	{ "<Leader>mD", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" } },
		-- 	{ "<Leader>md", "<Cmd>MultipleCursorsJumpNextMatch<CR>" },
		-- 	{ "<Leader>ml", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" } },
		-- },
	},
}
