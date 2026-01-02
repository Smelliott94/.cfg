return {
	-- 1. LSP & Intellisense
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({ ensure_installed = { "basedpyright", "stylua" } })
			vim.lsp.config("basedpyright", {
				settings = {
					python = {
						analysis = {
							useLibraryCodeForTypes = true,
						},
						venvPath = ".",
						venv = ".venv",
					},
				},
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("basedpyright")
			vim.lsp.enable("stylua")
		end,
	},

	-- 2. Debugging (DAP)
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			-- Automatically open UI when debugging starts
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- Points to the python in your mason folder
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},

	-- 3. Testing (Neotest)
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/neotest-python", "nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim" },
		config = function()
			require("neotest").setup({
				adapters = { require("neotest-python")({ runner = "pytest" }) },
			})
		end,
	},

	-- 4. Syntax Highlighting (Treesitter)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- 0.11 has built-in parsers for lua and vimdoc; we focus on dev languages
			ensure_installed = { "python", "bash", "markdown", "svelte", "javascript", "typescript", "html", "css" },
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	-- Formatters
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	-- ~/.config/nvim/lsp/lua_ls.lua
}
