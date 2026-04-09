local function install_mini()
    vim.pack.add({
        "https://github.com/nvim-mini/mini.nvim",
        {
            src = "https://github.com/nvim-mini/mini.nvim",
            version = "stable",
        },
    })
end

if pcall(install_mini) then
    vim.schedule(function()
        local _, err = pcall(function()
            -- see https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-comment.md
            require("mini.comment").setup({})
            require("mini.pairs").setup({}) -- note disable blink auto_brackets
            require("mini.git").setup({})
            require("mini.diff").setup({})
            require("nvim-web-devicons")
            -- Fancy status line, requires: nvim-web-devicons, git and diff modules
            require("mini.statusline").setup({})
        end)
        if err then
            vim.notify("An error occurred while configuring mini modules", vim.log.ERROR)
        end
    end)
end
