return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    local kind_labels = {
      Text = 'text',
      Method = 'method',
      Function = 'function',
      Constructor = 'new',
      Field = 'field',
      Variable = 'var',
      Class = 'class',
      Interface = 'iface',
      Module = 'module',
      Property = 'prop',
      Unit = 'unit',
      Value = 'value',
      Enum = 'enum',
      Keyword = 'keyword',
      Snippet = 'snippet',
      Color = 'color',
      File = 'file',
      Reference = 'ref',
      Folder = 'dir',
      EnumMember = 'member',
      Constant = 'const',
      Struct = 'struct',
      Event = 'event',
      Operator = 'op',
      TypeParameter = 'type',
    }

    -- Let the active colourscheme style completion items.

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered {
          border = 'rounded',
          scrollbar = false,
          col_offset = -2,
          side_padding = 1,
          winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = cmp.config.window.bordered {
          border = 'rounded',
          scrollbar = false,
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,Search:None',
        },
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        expandable_indicator = false,
        format = function(entry, vim_item)
          vim_item.kind = kind_labels[vim_item.kind] or vim_item.kind:lower()
          vim_item.menu = ({
            nvim_lsp = 'LSP',
            luasnip = 'SNIP',
            path = 'PATH',
          })[entry.source.name] or entry.source.name
          return vim_item
        end,
      },
      experimental = {
        ghost_text = false,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
