local nvimWebDevicons = {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local web_devicons = require("nvim-web-devicons")
    web_devicons.setup({
      override = {
        rb = {
          icon = "",
          color = "#ff8587",
          name = "DevIconRb",
        },
        ["nest-cli.json"] = {
          icon = "",
          color = "#e0234e",
          name = "DevIconNestCliJson",
        }
      },
    })
  end,
  event = "VeryLazy",
}
return nvimWebDevicons
