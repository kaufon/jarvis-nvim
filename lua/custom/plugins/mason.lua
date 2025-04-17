local mason =
{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      --mason package name goes here,for consult go to: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc%2Fserver-mapping.md
      "clangd",
      "pyright",
      "rubocop",
      "lua-language-server",
      "html-lsp",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "tailwindcss-language-server",
      "solang",
      "typescript-language-server",
      "solhint",
      "solargraph",
      "ruby-lsp",
      "sqlls",
      "python-lsp-server",
      "gopls",
      "prisma-language-server",
      "rust-analyzer",
      ----FORMATERS-----
      "stylua",
      "rubyfmt",
      "htmlbeautifier",
      "beautysh",
      "yamlfix",
      "prettierd",
      "gofumpt",
      "goimports_reviser",
      "xmllint",
      "biome",

    }
  }
}
return mason
