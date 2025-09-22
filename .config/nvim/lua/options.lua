vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.noswap = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.cursorline = false

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.filetype.add {
  extension = {
    k = 'kcl',
  },
}
