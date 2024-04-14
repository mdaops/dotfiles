return {
  'sanathks/workspace.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('workspace').setup {
      workspaces = {
        { name = 'dotfiles', path = '~/dotfiles/.config', keymap = { '<leader>wd' }, { desc = 'dotfiles' } },
        { name = 'me', path = '~/gh/personal/', keymap = { '<leader>wm' }, { desc = 'me' } },
        { name = 'platform', path = '~/gh/loqate/platform', keymap = { '<leader>wl' }, { desc = 'loqate platform' } },
      },
    }
  end,
}
