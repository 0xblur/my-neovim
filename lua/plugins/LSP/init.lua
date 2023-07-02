return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      -- { "j-hui/fidget.nvim",       config = true },
      { "smjonas/inc-rename.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- There are some already installed lsp's thanks to null-ls. These are:
        -- "ruff-lsp",
        rust_analyzer = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "curlylint",
        "rust-analyzer",
      },
    },
    -- config = function(plugin)
    --   require("mason").setup()
    --   local mr = require "mason-registry"
    --   for _, tool in ipairs(plugin.ensure_installed) do
    --     local p = mr.get_package(tool)
    --     if not p:is_installed() then
    --       p:install()
    --     end
    --   end
    -- end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" } }),
          nls.builtins.formatting.ruff,
        },
      }
    end,
  },

  -- {
  --   "utilyre/barbecue.nvim",
  --   event = "Verylazy",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = true,
  -- },
}
