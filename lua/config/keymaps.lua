local km = vim.keymap
local wk = require("which-key")
local prefix = { prefix = "<leader>", noremap = true } -- For wk prefix

-- Clear search with <esc>
km.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- better up/down
km.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
km.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
km.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
km.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
km.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
km.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
km.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
km.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
km.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Resize window using <ctrl> arrow keys
km.set("n", "<C-w>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
km.set("n", "<C-s>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
km.set("n", "<C-a>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
km.set("n", "<C-d>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Pane Navigation
km.set("n", "<C-h>", "<C-w>h", { desc = "navigate left window" }) -- Navigate Left
km.set("n", "<C-j>", "<C-w>j", { desc = "navigate down window" }) -- Navigate Down
km.set("n", "<C-k>", "<C-w>k", { desc = "navigate up window" }) -- Navigate Up
km.set("n", "<C-l>", "<C-w>l", { desc = "navigate right window" }) -- Navigate Right

-- buffers
km.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
km.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- neo-tree
km.set("n", "<A-t>", ":Neotree filesystem reveal right toggle<CR>", { noremap = true, silent = true })
km.set("n", "<A-d>", ":Neotree focus<CR>", { noremap = true, silent = true })

-- Indenting
km.set("v", "<", "<gv", { desc = "left shift indent" }) -- Shift Indentation to Left
km.set("v", ">", ">gv", { desc = "right shift indent" }) -- Shift Indentation to Right

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

-- Cursors CTRL_KEYS
km.set({ "n", "i" }, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "add cursor down" })
km.set({ "n", "i" }, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "add cursor up" })
km.set({ "n", "i" }, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", { desc = "add cursor on click" })

local duck = require("duck") -- for `duck` plugin keymap
local builtin = require("telescope.builtin")

wk.register({
	c = {
		f = {
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			"Conform Format",
		},
	},
}, { mode = { "n", "v" }, prefix = "<leader>", noremap = true })

wk.register({

	-- Code Actions
	c = {
		name = "+Code",
		F = {
		  vim.lsp.buf.format --[[({ name = "efm", async = true })]],
		  "Format"
		},
		-- F = {
		-- 	vim.lsp.buf.format({ name = "efm", async = true }),
		-- 	"efmls format",
		-- },
		d = {
			name = "+Diagnostics",
			f = { vim.diagnostic.open_float, "Open Diagnostics in Floating Window" },
			l = { vim.diagnostic.setloclist, "Add Buffer Diagnostics to the Location List" },
		},
	},

	-- Window Management
	s = {
		name = "+split",
		v = { ":vsplit<CR>", "New Vertical Window" },
		h = { ":split<CR>", "New Horizontal Window" },
		t = {
			name = "+terminal",
			t = { ":terminal<CR>i", "Open Term Here" },
			v = { ":vsplit<CR>:terminal<CR>i", "Open Term On Vertical Split" },
			h = { ":split<CR>:terminal<CR>i", "Open Term On Vertical Split" },
			l = { "<cmd>Lspsaga term_toggle<CR>", "Open Term In Floating Window" },
		},
	},

	-- Telescope
	f = {
		name = "+Find",
		f = { builtin.find_files, "Files" },
		g = { builtin.live_grep, "Live Grep" },
		b = { builtin.buffers, "Buffers" },
		k = { builtin.keymaps, "Keymaps" },
		h = { builtin.help_tags, "Help Tags" },
	},

	-- Trouble
	x = {
		name = "+Trouble",
		x = { "<cmd>TroubleToggle<CR>", "Doc Diagnostics" },
		X = { "<cmd>TroubleToggle<CR>", "Workspace Diagnostics" },
		q = { "<cmd>TroubleToggle<CR>", "Quickfix List" },
		l = { "<cmd>TroubleToggle<CR>", "Location List" },
		p = {
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			"Previous Trouble/Quickfix Item",
		},
		n = {
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			"Next Trouble/Quickfix Item",
		},
	},

	-- Cursors
	m = {
		name = "+Add Cursors",
		a = { "<Cmd>MultipleCursorsAddMatches<CR>", "On All Matches" },
		A = { "<Cmd>MultipleCursorsAddMatchesV<CR>", "On All V Matches" },
		D = { "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", "On Next Match" },
		d = { "<Cmd>MultipleCursorsJumpNextMatch<CR>", "Go To Next Match" },
		l = { "<Cmd>MultipleCursorsLock<CR>", "Lock Main Cursor" },
		-- See Cursors CTRL_KEYS
	},

	-- Yank Menu
	y = {
		name = "+Yank Menu",
		y = { "<Cmd>YankBank<CR>", "Open" },
	},

	-- Duck
	D = {
		name = "Duck",
		d = {
			function()
				duck.hatch("🦆", 5)
			end,
			"Spawn Duck",
		},
		c = {
			function()
				duck.hatch("🐈", 5)
			end,
			"Spawn Cat",
		},
		o = {
			function()
				duck.hatch("🦮", 8)
			end,
			"Spawn Dog",
		},
		k = {
			function()
				duck.cook()
			end,
			"Kill Last Spawn",
		},
		K = {
			function()
				duck.cook_all()
			end,
			"Kill Everything",
		},
	},

	-- Notifications
	-- n = {
	-- 	d = { require("notify").dismiss({ silent = true, pending = true }), "Dismiss All Notifications" },
	-- },
}, prefix)

-- Flash Start
wk.register({
	s = {
		function()
			require("flash").jump()
		end,
		"Flash",
	},
	S = {
		function()
			require("flash").treesitter()
		end,
		"Flash Treesitter",
	},
}, { mode = { "n", "x", "o" }, noremap = true, prefix = "" })
km.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash " })
km.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
km.set("c", "<C-s>", function()
	require("flash").treesitter_search()
end, { desc = "Toggle Flash Search" })
--Flash end

-- ############### OLD KEYMAPPINGS!!! ###############
-- km.set("n", "<leader>sv", ":vsplit<CR>", { desc = "vertical split" })
-- km.set("n", "<leader>sh", ":split<CR>", { desc = "horizontal split" })
-- km.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle maximize" })
-- km.set("n", "<leader>stt", ":terminal<CR>i", { desc = "open terminal" })
-- km.set("n", "<leader>stv", ":vsplit<CR>:terminal<CR>i", { desc = "terminal vertical split" })
-- km.set("n", "<leader>sth", ":split<CR>:terminal<CR>i", { desc = "terminal horizontal split " })
-- km.set("n", "<leader>ma", "<Cmd>MultipleCursorsAddMatches<CR>", { desc = "add cursor on matches" })
--
-- km.set("n", "<leader>mA", "<Cmd>MultipleCursorsAddMatchesV<CR>", { desc = "add cursor on v matches" })
-- km.set("n", "<leader>mD", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", { desc = "add cursor on next match" })
-- km.set("n", "<leader>md", "<Cmd>MultipleCursorsJumpNextMatch<CR>", { desc = "jump to next match" })
-- km.set("n", "<leader>ml", "<Cmd>MultipleCursorsLock<CR>", { desc = "lock primary cursor" })

-- km.set("n", "<leader>dd", function()
-- 	require("duck").hatch("🦆", 5)
-- end, { desc = "spawn duck" })
-- km.set("n", "<leader>dc", function()
-- 	require("duck").hatch("🐈", 5)
-- end, { desc = "spawn cat" })
-- km.set("n", "<leader>do", function()
-- 	require("duck").hatch("🦮", 5)
-- end, { desc = "spawn dog" })
-- km.set("n", "<leader>dk", function()
-- 	require("duck").cook()
-- end, { desc = "kill last spawn" })
-- km.set("n", "<leader>da", function()
-- 	require("duck").cook_all()
-- end, { desc = "kill everything" })
-- -km.set("n", "<leader>yy", "<Cmd>YankBank<CR>", { noremap = true, desc = "open yank menu" })
--
-- nvim-tree
-- km.set("n", "<A-d>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- km.set("n", "<A-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
