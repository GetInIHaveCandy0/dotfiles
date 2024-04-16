return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		local theme = require("lualine.themes.gruvbox_dark")
		theme.normal.c.bg = nil

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "buffers" }, -- 'branch', 'diff', 'diagnostics'
				lualine_c = { "diagnostics", "encoding" }, -- 'filename'
				lualine_x = { "searchcount", "selectioncount" },
				lualine_y = { "fileformat", "filetype", "filesize" }, -- 'encoding', 'fileformat', 'filetype'
				lualine_z = { "progress", "location" },
			},
		})
	end,
}
