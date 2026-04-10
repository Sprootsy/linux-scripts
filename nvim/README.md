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
While the configuration is mostly copied from lazynvim, I went through the pain
of doing everything manually to learn how nvim works.
[original kickstart](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua).


## TOODs:
  * Mason install tree-sitter on first run
