vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	{
		src = "https://github.com/mason-org/mason.nvim",
		version = "stable",
	},
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

vim.pack.add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{
		src = "https://github.com/mason-org/mason-lspconfig.nvim",
		version = "stable",
	},
})

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "vimls" },
})

vim.pack.add({
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	{
		src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
		version = "main",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"tree-sitter-cli",
	},
	auto_update = false,
	run_on_start = true, -- automatically install / update on startup
	start_delay = 0, -- no delay
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})
