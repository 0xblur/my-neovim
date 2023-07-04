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
      },
      ensure_installed = {
        "stylua",
        "shfmt"
      }
    },
    build = ":MasonUpdate",
    config = require "plugins.configs.mason"
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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●"
        },
        severity_sort = true,
      },
      inlay_hints = { enabled = false, },
      autoformat = true,
      format_notify = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil
      },
      servers = {
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeys[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
                }
              }
            }
          }
        },
        setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
        },
    },
    config = function(_, opts)
    local Util = require("lazyvim.util")
    -- Diagnostics
    -- local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

    -- if opts.inlay_hints.enabled and inlay_hint then
      -- Util.on_attach(function(client, buffer)
        -- if client.server_capabilities.inlayHintProvider then
          -- inlay_hint(buffer, true)
        -- end
      -- end)
    -- end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local servers = opts.servers

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      -- require("cmp_nvim_lsp").default_capabilities(),
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
        require("lspconfig")[server].setup(server_opts)
    end

      -- Get all servers available trough mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end




  end
  }
}
