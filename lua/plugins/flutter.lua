return {
  "nvim-flutter/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = vim.fn.expand("~/flutter/bin/flutter"),
    })
  end,
}
