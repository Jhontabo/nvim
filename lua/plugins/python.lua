local lsp = vim.g.lazyvim_python_lsp or "pyright"
local ruff = vim.g.lazyvim_python_ruff or "ruff"

return {
  -- Desactiva las pestanas de bufferline: todo se maneja por buffers
  { "akinsho/bufferline.nvim", enabled = false },

  -- LSP Servers (instalados automaticamente con mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = { enabled = false },
        [lsp] = {},
        [ruff] = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
        },
      },
      setup = {
        [ruff] = function()
          -- Desactiva hover en ruff en favor de pyright
          local ok, Snacks = pcall(require, "Snacks")
          if ok and Snacks.util then
            Snacks.util.lsp.on({ name = ruff }, function(_, client)
              client.server_capabilities.hoverProvider = false
            end)
          end
        end,
      },
    },
  },

  -- Formateo con ruff
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },

  -- Debugging con debugpy
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require("dap-python").setup("debugpy-adapter")
        end,
      },
    },
  },
}