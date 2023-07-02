-- `plugins/init.lua` is for plugins that does require no configuration or requie minimal configuration
return {
  "nvim-lua/plenary.nvim", -- Neovim-lua library, essential requirement for various modern plugins
  "MunifTanjim/nui.nvim",  -- Add UI components to Neovim
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = {
      integrations = { diffview = true },
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
    },
  },
}
