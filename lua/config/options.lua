-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.executable("/usr/bin/zsh") == 1 then
  vim.opt.shell = "/usr/bin/zsh"
end

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.lazyvim_ts_lsp = "tsgo"
vim.g.lazyvim_eslint_auto_format = false

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

pcall(vim.treesitter.language.register, "php", "blade")
