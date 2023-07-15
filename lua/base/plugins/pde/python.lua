return {
	{
		"neovim/nvim-lspconfig",
		ft = { "py" },
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				ruff_lsp = {},
				jedi_language_server = {
					settings = {
						auto_import_modules = { "numpy", "pandas", "matplotlib.pyplot" },
					},
				},
			},
		},
	},

	-- Diagnostics, formatter, and linters
	{
		"williamboman/mason.nvim",
		ft = { "py" },
		opts = function(_, opts)
			table.insert(opts.ensure_installed, "docformatter")
			table.insert(opts.ensure_installed, "mypy")
			table.insert(opts.ensure_installed, "ruff")
			table.insert(opts.ensure_installed, "black")
		end,
	},
	-- Add custom docformatter plugin to null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "py" },
		opts = function(_, opts)
			local nls = require("null-ls")
			local docformatter = {
				name = "docformatter",
				filetypes = { "python" },
				method = nls.methods.FORMATTING,
				generator = nls.formatter({
					command = "docformatter",
					args = { "--black", "-" },
					to_stdin = true,
				}),
				id = 1,
			}
			table.insert(opts.sources, docformatter)
			table.insert(opts.sources, nls.builtins.formatting.black)
			table.insert(opts.sources, nls.builtins.diagnostics.mypy)
		end,
	},
}
