return {
	{
		"neovim/nvim-lspconfig",
		ft = { "py" },
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								autopep8 = {
									enabled = false,
								},
								isort = {
									enabled = true,
								},
								black = {
									enabled = true,
									preview = true,
								},
								ruff = {
									enabled = true,
									extendSelect = { "I" },
									lineLength = 88,
								},
								mccabe = {
									enabled = false,
								},
								pyflakes = {
									enabled = false,
								},
								pycodestyle = {
									enabled = false,
								},
							},
						},
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
			-- table.insert(opts.ensure_installed, "mypy"mypy)
			-- table.insert(opts.ensure_installed, "ruff")
		end,
	},
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
		end,
	},
}
