return {
	settings = {
		Lua = {
			diagnostics = {
				-- Tell the linter that 'vim' is a global it should ignore
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files for completions
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
