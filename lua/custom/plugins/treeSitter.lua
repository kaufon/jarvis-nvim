local treeSitter =
{
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = function(_,opts)
    opts = require "plugins.configs.treesitter"
    opts.endwise = { enable = true }
          opts.indent = { enable = true, disable = { "yaml", "ruby" } }

    opts.ensure_installed = {
      "go",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "ruby",
      "embedded_template",
      "sql",
      "python",
      "c",
      "cpp",
      "css",
      "html",
      "json",
      "java",
      "groovy",
      "rust"
    }
  end
}

return treeSitter
