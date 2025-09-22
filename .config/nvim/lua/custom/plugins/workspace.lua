return {
  'sanathks/workspace.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('workspace').setup {
      workspaces = {
        { name = 'dotfiles', path = '~/dotfiles/.config', keymap = { '<leader>wd' }, { desc = 'dotfiles' } },
        { name = 'me', path = '~/gh/personal/', keymap = { '<leader>wm' }, { desc = 'me' } },
        { name = 'platform', path = '~/gh/gbg/platform', keymap = { '<leader>wp' }, { desc = 'loqate platform' } },
        { name = 'gbg', path = '~/gh/gbg/', keymap = { '<leader>wg' }, { desc = '' } },
      },
    }
  end,
}
