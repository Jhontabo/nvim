-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Jump to buffer by position in bufferline using <leader>1..5
for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", { desc = "Go to Buffer " .. i })
end

-- Split window to the right with <leader>+
pcall(vim.keymap.del, "n", "<leader>|")
vim.keymap.set("n", "<leader>+", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Select entire file with Ctrl+A
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Open terminal with <leader>t (Space + t)
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright split")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Open Terminal" })
