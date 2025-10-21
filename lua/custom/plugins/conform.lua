return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"
    conform.setup {
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
        biome = {
          formatWithErrors = true
        }
      },
      formatters_by_ft = {
        http = { "kulala" },
        lua = { "stylua" },
        ruby = { "rubocop" },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        yaml = { "yamlfix" },
        css = { "prettierd" },
        markdown = { "prettierd" },
        scss = { "prettierd" },
        go = { "gofumpt", "goimports-reviser", stop_after_first = false },
        xml = { "xmllint" },
        graphql = { "prettierd" },
        json = { "prettierd" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        astro = { "prettierd" },
      },
      format_on_save = false,
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        conform.format {
          lsp_fallback = true,
          async = true,
          timeout_ms = 5000,
        }
      end, { desc = "Format file 🐨" }),
    }
  end,
}
