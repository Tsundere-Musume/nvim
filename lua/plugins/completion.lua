return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "*",
  build = "cargo build --release",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default",
    ['<C-l>'] = {
      'snippet_forward',
      'fallback'
    },
    ['<C-h>'] = { 'snippet_backward', 'fallback' },
  },

    appearance = {
      nerd_font_variant = "mono",
    },

    signature = { enabled = true },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = false,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
