local treeSitter = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSUpdate" },
  build = ":TSUpdate",
  opts = function()
    return require "plugins.configs.treesitter"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")

    require("nvim-treesitter").install(opts.ensure_installed or {})

    vim.api.nvim_create_autocmd("FileType", {
      pattern = opts.ensure_installed or {},
      callback = function()
        vim.treesitter.start()
        if opts.indent and opts.indent.enable then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
return treeSitter
