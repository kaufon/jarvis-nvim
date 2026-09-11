return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "AGENTS.MD",
    provider = "claude-code",
    session_recovery = { enabled = false },
    mode = "agentic",
    acp_providers = {
      ["antigravity"] = {
        command = "antigravity-acp",
        args = {},
        auth_method = "agy-agent",
        env = {
          NODE_NO_WARNINGS = "1",
          HOME = os.getenv "HOME",
          PATH = os.getenv "PATH",
          AGY_BIN = vim.fn.exepath "agy",
        },
      },
      ["claude-code"] = {
        command = "npx",
        args = { "@agentclientprotocol/claude-agent-acp" },
        env = {
          NODE_NO_WARNINGS = "1",
          HOME = os.getenv "HOME",
          PATH = os.getenv "PATH",
        },
      },
    },
    input = {
      provider = "snacks",
      provider_opts = {
        title = "Avante Input",
        icon = " ",
      },
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
