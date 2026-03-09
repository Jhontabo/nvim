-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local MAX_LISTED_BUFFERS = 5

local function get_listed_buffers()
  local listed = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted then
      listed[#listed + 1] = buf
    end
  end
  return listed
end

vim.api.nvim_create_autocmd("BufAdd", {
  group = vim.api.nvim_create_augroup("max_listed_buffers", { clear = true }),
  callback = function(args)
    local new_buf = args.buf
    if not vim.bo[new_buf].buflisted then
      return
    end

    local listed = get_listed_buffers()
    if #listed <= MAX_LISTED_BUFFERS then
      return
    end

    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(new_buf) then
        return
      end

      local alt = vim.fn.bufnr("#")
      if alt > 0 and alt ~= new_buf and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
        pcall(vim.api.nvim_set_current_buf, alt)
      else
        for _, buf in ipairs(get_listed_buffers()) do
          if buf ~= new_buf and vim.api.nvim_buf_is_valid(buf) then
            pcall(vim.api.nvim_set_current_buf, buf)
            break
          end
        end
      end

      pcall(vim.cmd, "silent! bdelete " .. new_buf)
      vim.notify("Limite de 5 buffers alcanzado", vim.log.levels.WARN)
    end)
  end,
})
