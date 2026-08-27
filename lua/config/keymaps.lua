-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Split window to the right with <leader>+
pcall(vim.keymap.del, "n", "<leader>|")
vim.keymap.set("n", "<leader>+", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Select entire file with Ctrl+A in normal, visual, and insert mode
vim.keymap.set({ "n", "x" }, "<C-a>", "ggVG", { desc = "Select All" })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select All" })

-- Terminal toggle like LazyVim default, but on Ctrl+t
vim.keymap.set({ "n", "t" }, "<C-t>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- Yazi is now handled by yazi.nvim plugin (lua/plugins/yazi.lua)
