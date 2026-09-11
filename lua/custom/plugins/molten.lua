return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    lazy = false,
    build = ":UpdateRemotePlugins",
    init = function()
      -- Molten UI & Display settings
      vim.g.molten_auto_open_output = false
      vim.g.molten_image_provider = "none"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_output_win_cover_gutter = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      {
        "<leader>mi",
        function()
          local buf_name = vim.api.nvim_buf_get_name(0)
          local buf_dir = buf_name ~= "" and vim.fs.dirname(buf_name) or vim.fn.getcwd()
          local venv_path = vim.fs.find({ ".venv", "venv" }, { upward = true, path = buf_dir })[1]

          if venv_path then
            local python_bin = venv_path .. "/bin/python"
            if vim.fn.executable(python_bin) == 1 then
              local kernel_dir = vim.fn.expand "~/.local/share/jupyter/kernels/project_venv"
              vim.fn.mkdir(kernel_dir, "p")
              local kernel_spec = {
                argv = { python_bin, "-m", "ipykernel_launcher", "-f", "{connection_file}" },
                display_name = "Project .venv",
                language = "python",
              }
              local file = io.open(kernel_dir .. "/kernel.json", "w")
              if file then
                file:write(vim.fn.json_encode(kernel_spec))
                file:close()
              end
              pcall(vim.cmd, "MoltenDeinit")
              vim.cmd "MoltenInit project_venv"
              vim.notify("⚡ Molten connected to .venv: " .. python_bin, vim.log.levels.INFO)
              return
            end
          end

          vim.cmd "MoltenInit"
        end,
        desc = "Molten: Auto-init with .venv",
      },
      { "<leader>me", "<cmd>MoltenEvaluateOperator<cr>", desc = "Molten: Evaluate Operator" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Molten: Evaluate Line" },
      { "<leader>mr", "<cmd>MoltenReevaluateCell<cr>", desc = "Molten: Re-evaluate Cell" },
      { "<leader>mo", "<cmd>MoltenShowOutput<cr>", desc = "Molten: Show Output" },
      { "<leader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Molten: Hide Output" },
      { "<leader>md", "<cmd>MoltenDelete<cr>", desc = "Molten: Delete Cell Output" },
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Molten: Evaluate Selection" },
    },
  },

  -- Transparently opens .ipynb files as Python scripts with `# %%` cell markers
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    opts = {
      style = "percent",
      output_extension = "py",
      force_ft = "python",
    },
  },
}
