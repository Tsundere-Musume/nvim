return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  config = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      compile = true,
      functionStyle = { bold = true },
      dimInactive = true,
    })
    -- vim.cmd 'colorscheme kanagawa-wave'
    vim.cmd("colorscheme kanagawa-dragon")
    -- vim.cmd("colorscheme kanagawa-lotus")
  end,
  overrides = function(colors)
    local theme = colors.theme
    local makeDiagnosticColor = function(color)
      local c = require("kanagawa.lib.color")
      return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
    end

    return {
      DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
      DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
      DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
      DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
    }
  end,
}
