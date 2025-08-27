  # NVIM Config
  I use lua to initialize vim and lazynvim as plugin manager.
  In the init.lua we siply import the `sprootsy` module that contains the actual configs.

  Install with `cp -R nvim ~/.config/`, then run `nvim`.

  ### Vimopts
  This is where I set the various vim options using the lua api of nvim.

  ### Lazy nvim
  This is a package manager written in lua. Currently, I mainly use it to install and 
  configure the LSP language server and the autocomplete.
  Pluging are configured in the `after/plugins` folder.
  
