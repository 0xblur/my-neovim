return {
  -- Install Mason
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
      "MasonUpdateAll",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
      pip = {
        upgrade_pip = true,
      }
    },
    build = ":MasonUpdate",
    config = require "plugins.configs.mason",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    cmd = {
      "LspInstall",
      "LspUninstall",
    },
    opts = {
      ensure_installed = { "lua_ls", "marksman", "tsserver", "ruff_lsp", "tsserver" },
      automatic_installation = true
    },
    config = require"plugins.configs.mason-lspconfig"
  },
  {
    "neovim/nvim-lspconfig",
    cmd = {
      "LspStart",
      "LspInfo"
    },
    opts = function()
      local lspconfig = require'lspconfig'
      lspconfig.ruff_lsp.setup {
        filetypes = { "py", "ipynb" }
      }
      lspconfig.tsserver.setup {
        filetypes = { "rs" }
      }
      lspconfig.rust_analyzer.setup {
        filetypes = { "rs" }
      }
      lspconfig.lua_ls.setup {
        filetypes = { "lua" }
      }
      lspconfig.marksman.setup {
        filetypes = { "md" }
      }
    end,
    config = require"plugins.configs.nvim-lspconfig"
  }
}
