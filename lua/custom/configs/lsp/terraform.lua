local base = require "plugins.configs.lspconfig"
local capabilities = base.capabilities
local on_attach = base.on_attach
return {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "tf", "terraform", "hcl"},
}
