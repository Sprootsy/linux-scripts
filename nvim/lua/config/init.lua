require('config.lazy')


vim.filetype.add({
  pattern = {
    ['.*\\.py$'] = 'python',
  },
})



require('profile.default')
