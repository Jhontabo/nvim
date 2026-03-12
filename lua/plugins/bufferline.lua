return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.name_formatter = function(buf)
        if vim.bo[buf.bufnr].buftype == "terminal" then
          return "terminal"
        end
        return buf.name
      end
    end,
  },
}
