local base = require "plugins.configs.lspconfig"

local mason_registry = require "mason-registry"

local vue_ls_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

local on_attach = base.on_attach

local capabilities = base.capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"

local servers = {

  "clangd",
  "kulala_ls",
  "pylsp",
  "ruby_lsp",
  "lua_ls",
  "html",
  "jsonls",
  "yamlls",
  "dockerls",
  "tailwindcss",
  "solang",
  "solidity",
  "ts_ls",
  "gopls",
  "prismals",
  "solargraph",
}

require("java").setup()

require("lspconfig").jdtls.setup {}
for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = servers[server_name],
  }
end
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript={
      tsdk= vim.fn.expand("~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/")
    }
  },
}

lspconfig.gopls.setup {
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
}
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_ls_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = false,
        },
        variableTypes = { enabled = true },
      },
    },
  },
}
lspconfig.ruby_lsp.setup {

  on_attach = on_attach,

  capabilities = capabilities,

  filetypes = { "ruby" },

  root_dir = util.root_pattern("Gemfile", ".git"),

  init_options = {

    formatter = "auto",

    single_file_support = true,
  },
}
lspconfig.solargraph.setup {

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
