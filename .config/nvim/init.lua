-- 1. Set Leader Key (Must be done before plugins are loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 2. General Settings
local opt = vim.opt
opt.updatetime = 300
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.mouse = "a" -- Allow mouse support
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Don't ignore case if search has capitals
opt.tabstop = 4 -- Number of spaces a tab counts for
opt.shiftwidth = 4 -- Size of an indent
opt.expandtab = true -- Convert tabs to spaces
opt.termguicolors = true -- Enable 24-bit RGB color
opt.clipboard = "unnamedplus"
vim.diagnostic.config({
	virtual_text = true, -- Shows text at the end of the line
	float = {
		border = "rounded",
		source = "always", -- Shows if it's Pyright, Lua_LS, etc.
	},
})
-- 3. Keymaps (General)
local keymap = vim.keymap
-- Normal mode
keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "LSP: Show documentation" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit without saving" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Insert Mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- Stay in visual mode while indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Keymap to toggle with Space + e, close tree if it has focus
vim.keymap.set("n", "<leader>e", function()
	local api = require("nvim-tree.api")
	local bufnr = vim.api.nvim_get_current_buf()

	if api.tree.is_visible() and api.tree.is_tree_buf(bufnr) then
		api.tree.close()
	else
		api.tree.open()
	end
end, { desc = "Toggle File Explorer" })
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from ~/.config/nvim/lua/plugins/*.lua
require("lazy").setup("plugins")
