return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("opencode").toggle()
      end,
      mode = { "n" },
      desc = "Toggle Codex",
    },
    {
      "<leader>as",
      function()
        require("opencode").select({ submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex select",
    },
    {
      "<leader>ai",
      function()
        require("opencode").ask("", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex ask",
    },
    {
      "<leader>aI",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex ask with context",
    },
    {
      "<leader>ab",
      function()
        require("opencode").ask("@file ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex ask about buffer",
    },
    {
      "<leader>ap",
      function()
        require("opencode").prompt("@this", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex prompt",
    },
    -- Built-in prompts
    {
      "<leader>ape",
      function()
        require("opencode").prompt("explain", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex explain",
    },
    {
      "<leader>apf",
      function()
        require("opencode").prompt("fix", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex fix",
    },
    {
      "<leader>apd",
      function()
        require("opencode").prompt("diagnose", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex diagnose",
    },
    {
      "<leader>apr",
      function()
        require("opencode").prompt("review", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex review",
    },
    {
      "<leader>apt",
      function()
        require("opencode").prompt("test", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex test",
    },
    {
      "<leader>apo",
      function()
        require("opencode").prompt("optimize", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Codex optimize",
    },
  },
  config = function()
    vim.g.opencode_opts = {
      provider = {
        snacks = {
          win = {
            position = "left",
          },
        },
      },
    }
    vim.o.autoread = true
  end,
}
