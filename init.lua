-- bootstrap lazy.nvim, LazyVim and your plugins
require("base.config.options")
require("base.config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("base.config.autocmds")
    require("base.config.keymaps")
  end,
})

-- Load plugins
require "base.plugins"
-- Load catppuccin as start-up theme
vim.cmd.colorscheme "catppuccin"
