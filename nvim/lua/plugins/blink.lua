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
            documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "lua" },
        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true },
    })
end)
