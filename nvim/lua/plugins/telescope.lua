require("plugins.plenary")
require("plugins.web-devicons")

vim.pack.add({
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim.git",
    {
        src = "https://github.com/nvim-telescope/telescope.nvim.git",
        version = "v0.2.2",
    },
})

local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
require("telescope").setup({
    defaults = { vimgrep_arguments = vimgrep_arguments },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,          -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
    },
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
