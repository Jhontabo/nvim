return {
  {
    "nvim-flutter/flutter-tools.nvim",
    -- Cargar el plugin solo cuando se abra un archivo .dart
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Opcional: mejora las ventanas de selección (vim.ui.select)
    },
    -- Usa 'opts' para la configuración, estilo LazyVim.
    -- Esto es equivalente a require('flutter-tools').setup({})
    opts = {
      -- Puedes añadir opciones específicas aquí si es necesario.
      -- Por ejemplo, si deseas cambiar la ubicación de los logs:
      -- settings = {
      --   log_path = vim.fn.stdpath "data" .. "/flutter.log",
      -- },
    },
  },
}
