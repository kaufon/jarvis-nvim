return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "Davidyz/VectorCode",
      version = "*",
      build = "pipx upgrade vectorcode",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  event = "VeryLazy",
  opts = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-3.7-sonnet",
          },
        },
      })
    end,
    strategies = {
      chat = {
        roles = {
          user = "K.V",
          llm = "Jarvis A.I",
        },
      },
    },
    display = {
      chat = {
        intro_message = "Welcome home sir! I am Jarvis A.I, your personal assistant. How can I help you today?",
      },
    },
  },
}
