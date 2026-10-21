# NVIM Config
I use lua to initialize vim and lazynvim as plugin manager.

Install with `make install`, then run `nvim`.

### Requirements

  * nvim >= 0.12.1
  * node >= 25.9.0
  * python >= 3.12

### Vimopts
This is where I set the various vim options using the lua api of nvim.

### Lazy nvim
Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim), bootstrapped from
`lua/config/lazy.lua`. Each file under `lua/plugins/` returns a lazy.nvim plugin spec (or a
list of specs) and is auto-imported, so adding a plugin is as simple as dropping a new file
in that directory.
Keymaps and other non-plugin-manager config are mostly copied over from
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua).


## TOODs:
  * Mason install tree-sitter on first run
