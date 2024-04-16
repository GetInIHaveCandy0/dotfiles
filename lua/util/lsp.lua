local km = vim.keymap

local M = {}

-- set keymaps on the active lsp server

M.on_attach = function(client, bufnr)
	km.set(
		"n",
		"<leader>ca",
		"<cmd>Lspsaga code_action<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "code actions" }
	)
	km.set(
		"n",
		"<leader>rn",
		"<cmd>Lspsaga rename<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "smart rename" }
	)
	km.set(
		"n",
		"<leader>wrn",
		"<cmd>Lspsaga project_replace<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "wide smart rename" }
	)
	km.set(
		"n",
		"<leader>lgD",
		"<cmd>Lspsaga goto_definition<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "go to definition" }
	)
	km.set(
		"n",
		"<leader>llD",
		"<cmd>Lspsaga show_line_diagnostics<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "diagnostics for line" }
	)
	km.set(
		"n",
		"<leader>lcd",
		"<cmd>Lspsaga show_cursor_diagnostics<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "diagnostics for cursor" }
	)
	km.set(
		"n",
		"<leader>lpd",
		"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "jump to prev diagnostic" }
	)
	km.set(
		"n",
		"<leader>lnd",
		"<cmd>Lspsaga diagnostic_jump_next<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "jump to next diagnostic" }
	)
	km.set(
		"n",
		"K",
		"<cmd>Lspsaga hover_doc<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "documentation under cursor" }
	)
	km.set(
		"n",
		"<leader>ltf",
		"<cmd>Lspsaga finder<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "toggle finder" }
	)
	km.set(
		"n",
		"<leader>lto",
		"<cmd>Lspsaga outline<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "toggle outline" }
	)

	if client.name == "pyright" then
		km.set(
			"n",
			"<Leader>lpoi",
			"<cmd>PyrightOrganizeImports<CR>",
			{ noremap = true, silent = true, buffer = bufnr, desc = "Organize imports" }
		)
	end
	if client.name == "clangd" then
		km.set("n", "<leader>lcsh", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch Source/Header" })
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

return M
