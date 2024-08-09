local augroup = vim.api.nvim_create_augroup
local opt = vim.opt

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'hcl', 'terraform' },
  desc = 'terraform/hcl commentstring configuration',
  command = 'setlocal commentstring=#\\ %s',
})

local indentation = augroup('identation', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go' },
  desc = 'correct tab / space size for *.go',
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
  end,
  group = indentation,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my-inlay-hints', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require('inlay-hints').on_attach(client, args.buf)
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'sqlx' },
  callback = function()
    vim.g.autoformat = false
  end,
})
