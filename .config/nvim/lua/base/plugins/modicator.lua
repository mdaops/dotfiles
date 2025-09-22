return {
  'mawkler/modicator.nvim',
  dependencies = 'scottmckendry/cyberdream.nvim',
  init = function()
    vim.o.cursorline = false
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {},
}
