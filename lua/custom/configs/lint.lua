local lint = require("lint")
lint.linters_by_ft = {
  javascript = { 'biomejs' },
  typescript = { 'biomejs' },
  typescriptreact = { 'biomejs' },
  javascriptreact = { 'biomejs' },
}
local lint_augroup = vim.api.nvim_create_augroup("Lint", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "BufEnter" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
vim.keymap.set("n", "<leader>ll", function()
  lint.try_lint()
end, { desc = "Trigger linting for current buffer" })
