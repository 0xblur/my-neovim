return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    init = function()
        -- disable rtp plugin, as we only need its queries for mini.ai
        -- In case other textobject modules are enabled, we will load them
        -- once nvim-treesitter is loaded
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        load_textobjects = true
    end,
  },
  cmd = {
    "TSUpdateSync",
  },
  build = ":TSUpdate",
  opts = function()
    return {
      ensure_installed = { 'lua', 'vim', 'vimdoc', 'python' },
      auto_install = true,
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      }
  end,
  config = require "base.plugins.configs.nvim-treesitter",
}
