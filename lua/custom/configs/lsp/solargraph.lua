local base = require "plugins.configs.lspconfig"
local capabilities = base.capabilities
local on_attach = base.on_attach
local util = require "lspconfig/util"
return {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
      completion = true,
      autoformat = true,
      useBundler = false,
    },
  },
}
-- lspconfig.ruby_lsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "ruby" },
--   root_dir = util.root_pattern("Gemfile", ".git"),
--   init_options = {
--     formatter = "auto",
--     single_file_support = true,
--   },
-- }

