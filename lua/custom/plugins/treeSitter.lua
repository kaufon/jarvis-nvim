return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    dofile(vim.g.base46_cache .. "syntax")

    local ensure_installed = { "ruby", "lua", "python", "vim", "vimdoc", "vue" }

    local installed = require("nvim-treesitter.config").get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure_installed)

    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        pcall(function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end)
      end,
    })
  end,
}
