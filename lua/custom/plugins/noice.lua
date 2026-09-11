local noice =

{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      }
    },
    routes = {
      {
        filter = {
          event = "notify",
          find = "Unknown notification method",
        },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = 18,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 21,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      }
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
return noice
