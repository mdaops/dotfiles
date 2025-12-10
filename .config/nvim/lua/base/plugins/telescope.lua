return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'ANGkeith/telescope-terraform-doc.nvim' },
    { 'cappyzawa/telescope-terraform.nvim' },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        ['file_browser'] = {},
        ['terraform_doc'] = {
          url_open_command = 'xdg-open',
          latest_provider_symbol = '  ',
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'file_browser')
    pcall(require('telescope').load_extension, 'terraform_doc')

    vim.keymap.set('n', '<leader>std', ':Telescope terraform_doc<CR>', { desc = '[S]earch [T]erraform [D]ocs' })
  end,
}
