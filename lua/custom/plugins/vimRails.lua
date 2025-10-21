return {
  "tpope/vim-rails",
  event = "VeryLazy",
  config = function()
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
      pattern = { "*.yml" },
      callback = function()
        vim.bo.filetype = "yaml"
      end,
    })
  end,
}
