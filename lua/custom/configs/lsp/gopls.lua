local base = require "plugins.configs.lspconfig"
local capabilities = base.capabilities
local on_attach = base.on_attach
local util = require "lspconfig/util"
return {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, buffer_keymap_opts),
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buffer_keymap_opts),
  vim.keymap.set("n", "gr", function()
    require("telescope.builtin").lsp_references()
  end, buffer_keymap_opts),
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buffer_keymap_opts),
  vim.keymap.set("n", "K", vim.lsp.buf.hover, buffer_keymap_opts),
  vim.keymap.set("n", "<leader>ra", function()
    require("nvchad.renamer").open()
  end, buffer_keymap_opts),
  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, buffer_keymap_opts),
}
