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
        flavour = "latte",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = true,
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

  -- Make LazyVim load "catppuccin" as its primary colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin"
    },
  },


}
