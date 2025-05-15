return {
  "echasnovski/mini.nvim",
  config = function()
    local statusline = require("mini.statusline")
    local surround = require("mini.surround")
    statusline.setup({ use_icons = true })

    surround.setup({})
  end,
}
