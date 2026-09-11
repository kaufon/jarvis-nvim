return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup {
      completions = { lsp = { enabled = true } },
    }
  end,
}
