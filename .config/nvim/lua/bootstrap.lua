local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_imports = {
  { import = 'base.plugins' },
  { import = 'custom.plugins' },
}

if vim.uv.fs_stat(vim.fn.stdpath 'config' .. '/lua/custom/plugins/lang/elixir.lua') then
  table.insert(lazy_imports, { import = 'custom.plugins.lang.elixir' })
end

require('lazy').setup(lazy_imports)

vim.filetype.add {
  extension = {
    sqlx = 'sql',
  },
}

local workspace = require 'workspace'

vim.keymap.set('n', '<leader>ds', workspace.tmux_sessions, { desc = 'Show [S]essions' })
