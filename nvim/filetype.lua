vim.filetype.add({
  pattern = {
    ['.*\\.py$'] = 'python',
    ['docker-compose.yaml'] = 'yaml.docker-compose',
  },
})
