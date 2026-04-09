-- require('config.lazynvim')
require('plugins')


vim.filetype.add({
  pattern = {
    ['.*\\.py$'] = 'python',
  },
})



require('profile.default')
