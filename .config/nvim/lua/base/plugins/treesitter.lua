return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    -- Use Markdown highlighting for MDX until a dedicated parser is available.
    vim.treesitter.language.register('markdown', 'mdx')

    local treesitter = require 'nvim-treesitter'
    treesitter.setup {}
    treesitter.install {
      'bash',
      'c',
      'html',
      'lua',
      'markdown',
      'markdown_inline',
      'proto',
      'go',
      'gomod',
      'gowork',
      'gosum',
      'terraform',
      'hcl',
      'zig',
      'svelte',
      'sql',
      'wit',
    }

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then
          return
        end
        local function start()
          if vim.api.nvim_buf_is_valid(args.buf) and pcall(vim.treesitter.start, args.buf, lang) then
            if vim.treesitter.query.get(lang, 'indents') then
              vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
        end
        if vim.treesitter.language.add(lang) then
          start()
        elseif require('nvim-treesitter.parsers')[lang] then
          treesitter.install({ lang }):await(function()
            vim.schedule(start)
          end)
        end
      end,
    })
  end,
}
