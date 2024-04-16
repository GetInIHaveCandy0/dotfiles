return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			-- keybinds for navigation in lspsaga window
			symbol_in_winbar = {
				enable = true,
				separator = " › ",
				hide_keyword = false, -- when true some symbols like if and for
				-- Will be ignored (need treesitter)
				show_file = true, --Show file name before symbols
				folder_level = 1, --Show how many folder layers before the file name
				color_mode = true, --true mean the symbol name and icon have same color. Otherwise, symbol name is light-white
				delay = 300, --Dynamic render delay
			},
			callhireatchy = {
				layout = "float",
				keys = {
					edit = "e",
					vsplit = "s", --vsplit
					split = "i", -- split
					tabe = "t", -- open in new tab
					quit = "q", -- quit layout
					shuttle = "[w", -- shuttle between the layout left and right
					toggle_or_req = "u", -- toggle or do request
					close = "<C-c>k", -- close layout
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = true,
				extend_gitsigns = false,
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},

			move_in_saga = { prev = "<C-p>", next = "<C-n>" },
			-- use enter to open file with finder
			finder_action_keys = {
				open = "<CR>",
			},
			-- use enter to open file with definition preview
			definition = {
				keys = {
					edit = "<CR>",
				},
			},
			diagnostic = {
				show_code_action = true,
				jump_num_shortcut = true,
				text_hl_follow = true,

				extend_relatedInformation = true,
				show_layout = "float",
				diagnostic_only_current = false,
			},
			finder = {
				default = "def+tyd+ref+imp",
				methods = {
					--Keys are alias of LSP methods. Values are LSP methods, which you want show in finder. More info below
					-- For instance, methods = { 'tyd' = 'textDocument/typeDefinition' }
				},
				layout = "float", -- normal
				filter = {},
				silent = false,
				keys = {
					shuttle = "[w", --shuttle bettween the finder layout window
					toggle_or_open = "o", -- toggle expand or open
					vsplit = "s", -- open in vsplit
					split = "i", -- open in split
					tabe = "t", -- open in tabe
					tabnew = "r", -- open in new tab
					quit = "q", -- quit the finder, only works in layout left window
					close = "<C-c>k", -- close finder
				},
			},
			outline = {
				win_position = "left",
			},
			keys = {
				toggle_or_jump = "<A-o>",
				quit = "<A-O>",
				-- jump = '', -- idk what to set this to
			},
			rename = {
				keys = {
					select = "]w",
					exec = "<CR>",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
