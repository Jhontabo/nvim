return {
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter" },
    dependencies = { "zbirenbaum/copilot.lua" },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-k>",
        },
      },
    },
  },
}
