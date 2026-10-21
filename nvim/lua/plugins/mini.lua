return {
    "nvim-mini/mini.nvim",
    version = '*',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local ok, err = pcall(function()
            -- see https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-comment.md
            require("mini.comment").setup({})
            require("mini.pairs").setup({}) -- note disable blink auto_brackets
            require("mini.git").setup({})
            require("mini.diff").setup({})
            require("nvim-web-devicons")
            -- Fancy status line, requires: nvim-web-devicons, git and diff modules
            require("mini.statusline").setup({})
        end)
        if not ok then
            vim.notify("An error occurred while configuring mini modules: " .. tostring(err), vim.log.levels.ERROR)
        end
    end,
}
