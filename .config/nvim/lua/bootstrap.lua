local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { import = 'base.plugins' },
  { import = 'custom.plugins' },
  { import = 'custom.plugins.lang.elixir' },
}

vim.filetype.add {
  extension = {
    sqlx = 'sql',
  },
}

local workspace = require 'workspace'

vim.keymap.set('n', '<leader>ds', workspace.tmux_sessions, { desc = 'Show [S]essions' })
