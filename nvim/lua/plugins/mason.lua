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
