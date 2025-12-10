return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'normal', -- style for sidebars, see below
          floats = 'normal', -- style for floating windows
        },
        sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
      }
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        options = {
          style = 'darker', -- The theme comes in three styles, `dark`, `darker` and `light`
          transparency = true, -- Enable this to disable setting the background color
          terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
          sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
          hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
          dim_inactive = false, -- dims inactive windows
          lualine_bold = true, -- When `true`, section headers in the lualine
        },
      }
      -- vim.cmd.colorscheme 'onedark_dark'
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = true,
        italic_comments = true,
        hide_fillchars = false,
        terminal_colors = true,
        borderless_telescope = { border = true, style = 'flat' },
        theme = {
          variant = 'auto',
          overrides = function(colours)
            return {
              TelescopePromptPrefix = { fg = colours.blue },
              TelescopeMatching = { fg = colours.cyan },
              TelescopeResultsTitle = { fg = colours.blue },
              TelescopePromptCounter = { fg = colours.cyan },
              TelescopeNormal = { bg = 'none' },
              TelescopeResultsNormal = { fg = colours.bg, bg = 'none' },
              TelescopeSelection = { fg = colours.cyan, bg = 'none' },
              TelescopePromptTitle = { fg = colours.bg, bg = colours.blue, bold = true },
              TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
              TelescopePromptNormal = { bg = 'base' },
            }
          end,
        },
      }
      -- vim.cmd.colorscheme 'cyberdream'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = 'sapphire',
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enabled = true },
          notify = true,
          nvimtree = true,
          neotree = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }
      vim.cmd.hi 'Comment gui=none'
      local palette = require('catppuccin.palettes').get_palette 'macchiato'
      vim.cmd.colorscheme 'catppuccin-macchiato'

      -- Telescope highlights to match editor background
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = palette.blue, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = palette.blue, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = palette.blue, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = palette.blue, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = palette.mauve, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = palette.mauve, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = palette.mauve, bg = palette.base })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = palette.mauve, bg = palette.base })
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    config = function()
      require('rose-pine').setup {
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        highlight_groups = {
          TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
          TelescopeNormal = { bg = 'none' },
          TelescopePromptNormal = { bg = 'base' },
          TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
          TelescopeSelection = { fg = 'text', bg = 'base' },
          TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
          StatusLine = { fg = 'love', bg = 'love', blend = 10 },
          StatusLineNC = { fg = 'subtle', bg = 'surface' },
        },
      }
      -- vim.opt.laststatus = 2
      -- vim.cmd.hi 'Comment gui=none'
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
    end,
  },
}
