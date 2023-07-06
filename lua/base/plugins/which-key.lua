return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["gz"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+Tabs" },
				["<leader>b"] = { name = "+Buffer" },
				["<leader>c"] = { name = "+Code" },
				["<leader>f"] = { name = "+File/find" },
				["<leader>g"] = { name = "+Git" },
				["<leader>gh"] = { name = "+hunks" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>u"] = { name = "+UI" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+Diagnostics/Quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	-- Add noice.nvim to which-key menu
	{
		"folke/which-key.nvim",
		opts = function(_, opts)
			if require("lazyvim.util").has("noice.nvim") then
				opts.defaults["<leader>sn"] = { name = "+noice" }
			end
		end,
	},
}
