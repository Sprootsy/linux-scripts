require("plugins.friendly-snippets")

vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1.10.2",
	},
})

vim.schedule(function()
	local blink = require("blink.cmp")
	blink.setup({
		-- See :h blink-cmp-config-keymap for defining your own keymap
		completion = {
			-- By default, you may press `<c-space>` to show the documentation.
			-- Optionally, set `auto_show = true` to show the documentation after a delay.
			documentation = { auto_show = false, auto_show_delay_ms = 250 },
			-- Manages the completion list and its behavior when selecting items.
			list = {
				-- Selects the first item automatically but does not insert it.
				selection = { preselect = true, auto_insert = false },
			},
			accept = {
				resolve_timeout_ms = 200,
				auto_brackets = {
					enabled = false,
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },

			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					enabled = true, -- Whether or not to enable the provider
					timeout_ms = 2000,
					score_offset = 2, -- Boost/penalize the score of the items
					-- If this provider returns 0 items, it will fallback to these providers.
					-- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
					-- default fallback is 'buffer'
					fallbacks = { "buffer" },
				},
			},
		},
		fuzzy = { implementation = "lua" },
		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
		keymap = {
			preset = "default",
			["<tab>"] = { "accept", "fallback" },
		},
	})
end)
