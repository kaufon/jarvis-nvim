local nvimWebDevicons = {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local web_devicons = require "nvim-web-devicons"
    web_devicons.setup {
      override = {
        rb = {
          icon = "",
          color = "#ff8587",
          name = "DevIconRb",
        },
        ["nest-cli.json"] = {
          icon = "",
          color = "#e0234e",
          name = "DevIconNestCliJson",
        },
      },
      -- Add this section for pattern-based matching
      override_by_extension = {
        -- This pattern matches any file that ends with ".module.ts"
        ["service.ts"] = {
          icon = "",
          color = "#e0234e",
          name = "DevIconNestModule", -- A unique name for the new rule
        },

        ["module.ts"] = {
          icon = "",
          color = "#e0234e",
          name = "DevIconNestModule", -- A unique name for the new rule
        },
        ["controller.ts"] = {
          icon = "",
          color = "#e0234e",
          name = "DevIconNestModule", -- A unique name for the new rule
        },
      },
    }
  end,
  event = "VeryLazy",
}

return nvimWebDevicons
