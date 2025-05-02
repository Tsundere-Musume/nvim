return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", { "j-hui/fidget.nvim", opts = {} } },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
                rust_analyzer = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,

		-- -- example calling setup directly for each LSP
		--  config = function()
		--    local capabilities = require('blink.cmp').get_lsp_capabilities()
		--    local lspconfig = require('lspconfig')
		--
		--    lspconfig['lua_ls'].setup({ capabilities = capabilities })
		--  end
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",

			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		version = "*",
		build = "cargo build --release",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

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
	},
}
