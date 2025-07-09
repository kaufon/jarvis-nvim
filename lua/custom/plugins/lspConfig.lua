local lspConfig =
{
  "neovim/nvim-lspconfig",
  commit = "cb56808",
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lsp.init"
  end,
}
return lspConfig
