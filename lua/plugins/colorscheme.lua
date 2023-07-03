return {

  -- Install and configure "gruvbox" theme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup()
    end,
  },

  -- Install and configure "catppuccin" theme
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      local catppuccin = require "catppuccin"
      catppuccin.setup {
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        show_end_of_buffer = true,
        no_bold = true,
        styles = {
        	conditionals = { "bold" },
        	types = { "bold" }
        }
      }
    end,

  },

  -- Styler allows us to set a different colorscheme to specific file types.
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup({
        themes = {
          markdown = { colorscheme = "gruvbox" },
          help = { colorscheme = "gruvbox" },
        },
      })
    end,

  },

}
