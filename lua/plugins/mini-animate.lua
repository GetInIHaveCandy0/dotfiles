return {
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		version = false,
		opts = function()
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				-- Cursor path
				cursor = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					-- timing = --<function: implements linear total 250ms animation duration>,

					-- Path generator for visualized cursor movement
					-- path = --<function: implements shortest line path>,
				},

				-- Vertical scroll
				scroll = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					-- timing =  --<function: implements linear total 250ms animation duration>,

					-- Subscroll generator based on total scroll
					subscroll = animate.gen_subscroll.equal({ -- dont animate if mouse scroll
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
                return false
							end
              return total_scroll > 1
						end,
					}), --<function: implements equal scroll with at most 60 steps>,
				},

				-- Window resize
				resize = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }), --<function: implements linear total 250ms animation duration>,

					-- Subresize generator for all steps of resize animations
					-- subresize = --<function: implements equal linear steps>,
				},

				-- Window open
				open = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					-- timing = --<function: implements linear total 250ms animation duration>,

					-- Floating window config generator visualizing specific window
					-- winconfig = --<function: implements static window for 25 steps>,

					-- 'winblend' (window transparency) generator for floating window
					-- winblend = --<function: implements equal linear steps from 80 to 100>,
				},

				-- Window close
				close = {
					-- Whether to enable this animation
					enable = true,

					-- Timing of animation (how steps will progress in time)
					-- timing = --<function: implements linear total 250ms animation duration>,

					-- Floating window config generator visualizing specific window
					-- winconfig = --<function: implements static window for 25 steps>,

					-- 'winblend' (window transparency) generator for floating window
					-- winblend = --<function: implements equal linear steps from 80 to 100>,
				},
			}
		end,
	},
}
