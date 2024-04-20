return {
  'epwalsh/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'brain',
        path = '/mnt/c/Users/dev/Documents/second-brain/',
      },
    },
  },
}
