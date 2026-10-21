return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            automatic_enable = true,
            ensure_installed = { "vimls" },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "tree-sitter-cli",
            },
            auto_update = false,
            run_on_start = true, -- automatically install / update on startup
            start_delay = 0,     -- no delay
            debounce_hours = 5,  -- at least 5 hours between attempts to install/update
        },
    },
}
