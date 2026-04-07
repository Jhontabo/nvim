return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      local tools = {
        "debugpy",
        "eslint-lsp",
        "intelephense",
        "js-debug-adapter",
        "kotlin-language-server",
        "ktlint",
        "php-debug-adapter",
        "php-cs-fixer",
        "phpcs",
        "prettier",
        "pyright",
        "ruff",
        "tailwindcss-language-server",
        "tsgo",
      }

      for _, tool in ipairs(tools) do
        if not vim.tbl_contains(opts.ensure_installed, tool) then
          table.insert(opts.ensure_installed, tool)
        end
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.intelephense = vim.tbl_deep_extend("force", opts.servers.intelephense or {}, {
        settings = {
          intelephense = {
            files = {
              maxSize = 2000000,
            },
          },
        },
      })

      opts.servers.tailwindcss = vim.tbl_deep_extend("force", opts.servers.tailwindcss or {}, {
        filetypes_include = { "blade" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              blade = "html",
            },
          },
        },
      })

      for _, server in ipairs({ "tsserver", "ts_ls", "vtsls" }) do
        opts.servers[server] = vim.tbl_deep_extend("force", opts.servers[server] or {}, { enabled = false })
      end

      -- Keep tsgo explicit so this setup stays fast even if the extra import changes.
      opts.servers.tsgo = vim.tbl_deep_extend("force", opts.servers.tsgo or {}, {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        settings = {
          typescript = {
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = false },
              parameterNames = {
                enabled = "literals",
                suppressWhenArgumentMatchesName = true,
              },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      })

      opts.servers.kotlin_language_server = vim.tbl_deep_extend("force", opts.servers.kotlin_language_server or {}, {
        enabled = true,
        init_options = {
          compiler = {
            jvm = {
              target = "17",
            },
          },
        },
      })
    end,
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
    ft = { "php", "blade" },
    cmd = { "Laravel" },
    keys = {
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Laravel Artisan",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Laravel Routes",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.make()
        end,
        desc = "Laravel Make",
      },
      {
        "<leader>ll",
        function()
          Laravel.pickers.laravel()
        end,
        desc = "Laravel Picker",
      },
    },
    opts = {
      features = {
        pickers = {
          provider = "snacks",
        },
      },
    },
    cond = function()
      return vim.fn.executable("php") == 1
    end,
  },
}
