return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        http = { "kulala" },
        lua = { "stylua" },
        ruby = { "rubyfmt" },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        yaml = { "yamlfix" },
        css = { "prettierd" },
        scss = { "prettierd" },
        go = { "gofumpt", "goimports_reviser",stop_after_first=false },
        xml = { "xmllint" },
        graphql = { "prettierd" },
        json = { "prettierd" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },

      },
      format_on_save = false,
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file 🐨" })
    })
  end,
}
