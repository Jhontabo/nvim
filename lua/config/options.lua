-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.executable("/usr/bin/zsh") == 1 then
  vim.opt.shell = "/usr/bin/zsh"
end
