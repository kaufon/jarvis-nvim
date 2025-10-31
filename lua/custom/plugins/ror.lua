return {
  "weizheheng/ror.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip" },
  config = function()
    require("ror").setup({
      lsp = {
        name = "ruby_lsp",
      },

      cmp = {
        enable = true,
      },

      auto_run_rails_command = {
        generate = true,
        destroy = true,
        db = true,
      },
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>",
    { silent = true, desc = "List Rails Commands" }),
}
