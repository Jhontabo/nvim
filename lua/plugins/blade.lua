return {
  "ricardoramirezr/blade-nav.nvim",
  -- Opcional: si usas nvim-cmp para autocompletado, añade la dependencia.
  -- Si no lo usas, puedes quitar la línea 'dependencies'.
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  ft = { "blade", "php" }, -- Carga el plugin solo para archivos PHP y Blade (mejora el rendimiento)
  opts = {
    -- Esta opción añade automáticamente la etiqueta de cierre al autocompletar un componente.
    -- Por ejemplo, al completar <x-input te lo dejará como <x-input/>
    close_tag_on_complete = true,
  },
}
