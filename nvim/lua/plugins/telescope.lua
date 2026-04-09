require("plugins.plenary")
require("plugins.web-devicons")

vim.pack.add {
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
}

vim.pack.add {
    "https://github.com/nvim-telescope/telescope.nvim.git",
    {
        src = "https://github.com/nvim-telescope/telescope.nvim.git",
        version = "v0.2.2"
    }
}

require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
