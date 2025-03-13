local base = require("plugins.configs.lspconfig")

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"

local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

local on_attach = base.on_attach

local capabilities = base.capabilities
local util = require "lspconfig/util"


local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }

  vim.lsp.buf.execute_command(params)
end


local servers = {

  "clangd",
  "pylsp",
  "solargraph",
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
  "sqlls",
  "gopls",
  "prismals",
  "volar",
  
}
require('render-markdown').setup({
 completions = { lsp = { enabled = true } },
})
require('java').setup()
require('lspconfig').jdtls.setup({})
for _, server_name in ipairs(servers) do
    lspconfig[server_name].setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities
    })
end
lspconfig.solargraph.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  },
})
lspconfig.sqlls.setup {
  capabilities = capabilities,
  root_dir = function(_)
    return vim.loop.cwd()
  end,
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
        unusedparams = true
      }
    }
  }
}
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = volar_path,
        languages = { "vue" }
      },
    }
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  }
})
lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    },
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          parameterTypes = {
            enabled = true,
            suppressWhenArgumentMatchesName = true,
          },
          variableTypes = {
            enabled = true,
          },
        }
      }
    }
  },
})
