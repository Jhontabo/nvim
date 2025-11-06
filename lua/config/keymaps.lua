-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

--vim.api.nvim_set_keymap("n", "-", ":Oil<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", "<cmd>Yazi<CR>", { noremap = true, silent = true, desc = "open Yazi" })
vim.api.nvim_set_keymap("n", "<C-a>", "gg^VG", { noremap = true, silent = true })
