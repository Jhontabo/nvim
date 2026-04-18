return {
  {
    "mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters.java = {
        {
          type = "java$debug",
          request = "attach",
          hostName = "${workspaceFolder:JavaDebugHost}",
          port = "${workspaceFolder:JavaDebugPort}",
        },
      }
    end,
  },
  {
    "nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")
      local java_patterns = { "*.java", "pom.xml", "build.gradle", "gradle" }

      local function get_java_config()
        local config = {
          type = "java",
          request = "launch",
          name = "Debug (Launch) - Main class",
          console = "integratedTerminal",
          internalConsoleConsole = "never",
          mainClass = "",
          args = "",
          projectName = vim.fn.getcwd():match("([^/]+)$"),
        }
        return config
      end

      dap.configurations.java = {
        {
          type = "java",
          request = "launch",
          name = "Debug (Launch)",
          console = "integratedTerminal",
          mainClass = "${file}",
          args = "",
        },
        {
          type = "java",
          request = "launch",
          name = "Debug (Launch) with deps",
          console = "integratedTerminal",
          mavenOpts = { "${env:MAVEN_OPTS}" },
          projectName = vim.fn.getcwd():match("([^/]+)$"),
          mainClass = "${file}",
        },
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach)",
          hostName = "localhost",
          port = 5005,
        },
      }
    end,
    cond = function()
      return vim.bo.filetype == "java"
    end,
  },
}