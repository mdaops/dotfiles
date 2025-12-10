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

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 5
vim.opt.foldtext = ''

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = '80'

vim.opt.guicursor = {
  'n-v-c:block', -- Normal, visual, command-line: block cursor
  'i-ci-ve:ver25', -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  'r-cr:hor20', -- Replace, command-line replace: horizontal bar cursor with 20% height
  'o:hor50', -- Operator-pending: horizontal bar cursor with 50% height
  'a:blinkwait700-blinkoff400-blinkon250', -- All modes: blinking settings
  'sm:block-blinkwait175-blinkoff150-blinkon175', -- Showmatch: block cursor with specific blinking settings
}
