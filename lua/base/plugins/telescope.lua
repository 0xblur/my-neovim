return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim'
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', 'n', desc = 'Find files (telescope)' },
    { '<leader>fg', '<cmd>Telescope git_files<cr>', 'n', desc = 'Git files (telescope)' },
    { '<leader>fp', '<cmd>Telescope live_grep<cr>', 'n', desc = 'Grep project (telescope)'},
  },
  ft = 'mason',
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    return {
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
	extensions = {
	  fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
	  ['ui-select'] = { require 'telescope.themes'.get_dropdown() }
	},
	vimgrep_argument = { 'rg', '--smart-case' },
      },
    }
  end,
  config = require "base.plugins.configs.telescope",
}
