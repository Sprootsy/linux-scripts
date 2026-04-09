require("plugins.web-devicons")

vim.pack.add{
    "https://github.com/folke/which-key.nvim",
    { src = "https://github.com/folke/which-key.nvim", version = "stable" }
}

local wk = require("which-key")

wk.setup({
  -- delay between pressing a key and opening which-key (milliseconds)
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },

  -- Document existing key chains
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
})

