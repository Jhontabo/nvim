-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Sincroniza el portapapeles del sistema con el de Neovim
vim.opt.clipboard = "unnamedplus"

-- Configura win32yank como el proveedor del portapapeles
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 1,
}
