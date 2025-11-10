local base = require "plugins.configs.lspconfig"

local on_attach = base.on_attach

local capabilities = base.capabilities

local vtsls_config = require "custom.configs.lsp.vtsls"
local vue_ls_config = require "custom.configs.lsp.vue_ls"
local solarpgraph_config = require "custom.configs.lsp.solargraph"
local terraformls_config = require "custom.configs.lsp.terraform"
local tflint_config = require "custom.configs.lsp.tflint"
local gopls_config = require "custom.configs.lsp.gopls"

local lspconfig = require "lspconfig"

local servers = {
  "clangd",
  "kulala_ls",
  "pyright",
  "ruby_lsp",
  "lua_ls",
  "html",
  "jsonls",
  "yamlls",
  "dockerls",
  "tailwindcss",
  "solang",
  "solidity",
  "prismals",
  "astro",
  "jdtls",
}
for _, server_name in ipairs(servers) do
  if server_name ~= "jdtls" then
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      settings = servers[server_name],
    }
  end
end
-- lspconfig.solargraph.setup { solarpgraph_config }
lspconfig.gopls.setup { gopls_config }

vim.lsp.config.vtsls = vtsls_config
vim.lsp.config.volar = vue_ls_config
vim.lsp.config.terraformls = terraformls_config
vim.lsp.config.tflint = tflint_config

vim.lsp.enable { "vtsls", "volar","terraformls"}
