local base = require "plugins.configs.lspconfig"
local capabilities = base.capabilities
local vtsls_config = {
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "vue", "typescriptreact", "javascriptreact" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
    typescript = {
      preferences = {
        importModuleSpecifier = "non-relative",
        updateImportsOnFileMove = {
          enabled = "always",
        },
        suggest = {
          completeFunctionCalls = true,
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    local buffer_keymap_opts = { noremap = true, silent = true, buffer = bufnr }
    if vim.bo[bufnr].filetype == "vue" then
      client.server_capabilities.semanticTokensProvider = nil
    end
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, buffer_keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buffer_keymap_opts)
    vim.keymap.set("n", "gr", function()
      require("telescope.builtin").lsp_references()
    end, buffer_keymap_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buffer_keymap_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, buffer_keymap_opts)
    vim.keymap.set("n", "<leader>ra", function()
      require("nvchad.renamer").open()
    end, buffer_keymap_opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, buffer_keymap_opts)
  end,
}
require("lspconfig.configs").vtsls = require("vtsls").lspconfig
return vtsls_config
