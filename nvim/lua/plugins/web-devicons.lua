vim.pack.add {
    "https://github.com/nvim-tree/nvim-web-devicons",
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
        version = "v0.100"
    }
}

require'nvim-web-devicons'.setup {
     -- globally enable different highlight colors per icon (default to true)
     -- if set to false all icons will have the default icon's color
     color_icons = true;
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = true;
     -- set the light or dark variant manually, instead of relying on `background`
     -- (default to nil)
     variant = "dark";
}
