return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "-", "<cmd>Yazi<cr>", desc = "Open Yazi" },
  },
  opts = {
    open_for_directories = false,
    floating_window_scaling_factor = 0.9,
    yazi_floating_window_border = "rounded",
  },
}
