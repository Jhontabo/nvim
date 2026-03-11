return {
  "johnseth97/codex.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  cmd = { "Codex", "CodexToggle" },
  keys = {
    { "<leader>a", nil, desc = "AI/Codex" },
    {
      "<leader>ac",
      function()
        require("codex").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle Codex",
    },
    { "<leader>ai", "<cmd>Codex<cr>", desc = "Open Codex" },
  },
  opts = {
    keymaps = {
      toggle = nil,
      quit = "<C-q>",
    },
    border = "rounded",
    width = 0.80,
    height = 0.80,
    model = nil,
    autoinstall = true,
    panel = true,
    use_buffer = false,
  },
}
