local vault = vim.fn.expand '~/brain'

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = function()
    return {
      legacy_commands = false,
      workspaces = {
        {
          name = 'brain',
          path = vault,
        },
      },
      -- Readable file names from the note title instead of random IDs.
      note_id_func = require('obsidian.builtin').title_id,
      templates = {
        folder = 'templates',
      },
      frontmatter = {
        -- Leave the templates themselves alone.
        enabled = function(fname)
          return not (fname and fname:find('/templates/', 1, true))
        end,
        -- Every note gets exactly one status tag; new notes start as a draft.
        func = function(note)
          local out = require('obsidian.builtin').frontmatter(note)
          local tags = out.tags or {}
          for _, tag in ipairs(tags) do
            if tag:match '^status/' then
              out.tags = tags
              return out
            end
          end
          table.insert(tags, 1, 'status/draft')
          out.tags = tags
          return out
        end,
        sort = { 'id', 'aliases', 'type', 'tags', 'verified_against' },
      },
    }
  end,
}
