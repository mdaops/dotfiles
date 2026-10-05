return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'simrat39/inlay-hints.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local hover = vim.lsp.handlers.hover
    local hover_opts = function()
      local width = vim.api.nvim_win_get_width(0)
      local height = vim.api.nvim_win_get_height(0)

      local max_width = math.min(80, math.max(20, math.floor(width * 0.6)))
      local max_height = math.min(20, math.max(8, math.floor(height * 0.5)))

      if width > 8 then
        max_width = math.min(max_width, width - 4)
      end

      if height > 4 then
        max_height = math.min(max_height, height - 2)
      end

      return {
        border = 'rounded',
        focusable = false,
        max_width = max_width,
        max_height = max_height,
      }
    end

    vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
      config = vim.tbl_deep_extend('force', hover_opts(), config or {})
      return hover(err, result, ctx, config)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-T>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ss', require('telescope.builtin').lsp_document_symbols, 'Document [S]earch [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace
        --  Similar to document symbols, except searches over your whole project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Prefer PATH (Homebrew, Nix or Mason), then existing local installations.
    local function executable(name, fallback)
      local path = vim.fn.exepath(name)
      if path ~= '' then
        return path
      end
      if fallback and vim.fn.executable(vim.fn.expand(fallback)) == 1 then
        return vim.fn.expand(fallback)
      end
    end

    local servers = {
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            -- Work around rust-analyzer 1.98.1 panicking with "failed to unify
            -- type owners" while searching for replacements for `_` expressions.
            assist = { termSearch = { fuel = 0 } },
          },
        },
      },
      mdx_analyzer = {
        before_init = function(_, config)
          local tsdk = require('lspconfig.util').get_typescript_server_path(config.root_dir)
          if tsdk == '' then
            -- Documentation-only projects may not have their own TypeScript SDK.
            local vtsls = vim.fn.stdpath 'data' .. '/mason/packages/vtsls/node_modules/'
            for _, path in ipairs {
              vtsls .. 'typescript/lib',
              vtsls .. '@vtsls/language-server/node_modules/typescript/lib',
            } do
              if vim.uv.fs_stat(path .. '/typescript.js') then
                tsdk = path
                break
              end
            end
          end
          config.init_options.typescript.tsdk = tsdk
        end,
      },
      zls = {
        cmd = { executable('zls', '~/.local/bin/zls') or 'zls' },
        settings = {
          zig_exe_path = executable('zig', '~/.local/bin/zig'),
          enable_autofix = true,
          enable_inlay_hints = true,
          inlay_hints_show_variable_type_hints = true,
          inlay_hints_show_struct_literal_field_type = true,
          inlay_hints_show_parameter_name = true,
        },
      },
      svelte = {
        settings = {},
        filetypes = { 'svelte' },
        root_dir = require('lspconfig.util').root_pattern('svelte.config.js', 'package.json', '.git'),
      },
      tailwindcss = {
        settings = {},
      },
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
        },
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      },
      gopls = {
        cmd = { 'gopls' },
        settings = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
          semanticTokens = true,
        },
      },
      terraformls = {
        settings = {},
      },
      postgres_lsp = {
        root_dir = require('lspconfig.util').root_pattern('postgres-language-server.jsonc', 'postgrestools.jsonc', '.git'),
        settings = {},
      },
      sqls = {
        root_dir = require('lspconfig.util').root_pattern('config.yml', '.sqllsrc.json', '.git'),
        settings = {},
      },
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }
    require('mason').setup()

    local mason_lsp_servers = vim.tbl_filter(function(server_name)
      return server_name ~= 'zls'
    end, vim.tbl_keys(servers or {}))

    local ensure_installed = vim.deepcopy(mason_lsp_servers)
    vim.list_extend(ensure_installed, {
      'stylua',
      'prettier',
      'goimports',
      'gofumpt',
      'golines',
      'gomodifytags',
      'sqlfluff',
      'pgformatter',
      'sqlls',
    })

    for server_name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end

    local wit_server = executable('wit-language-server', '~/.cargo/bin/wit-language-server')
    if wit_server then
      vim.lsp.config('wit', {
        cmd = { wit_server, '--stdio' },
        capabilities = capabilities,
        filetypes = { 'wit' },
        root_markers = { 'wit.toml', '.git' },
      })
      vim.lsp.enable 'wit'
    end

    local function start_sql_servers(args)
      local bufnr = args and args.buf or vim.api.nvim_get_current_buf()
      if vim.bo[bufnr].filetype ~= 'sql' then
        return
      end

      local root_dir = vim.fs.root(bufnr, { 'postgres-language-server.jsonc', 'postgrestools.jsonc', 'config.yml', '.sqllsrc.json', '.git' })
        or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))

      for _, server_name in ipairs { 'postgres_lsp', 'sqls' } do
        if not vim.iter(vim.lsp.get_clients { bufnr = bufnr }):any(function(client)
          return client.name == server_name
        end) then
          local config = vim.deepcopy(vim.lsp.config[server_name])
          config.root_dir = root_dir
          vim.lsp.start(config, { bufnr = bufnr })
        end
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('sql-lsp-start', { clear = true }),
      pattern = 'sql',
      callback = start_sql_servers,
    })
    start_sql_servers()

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('gopls-semantic-tokens', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= 'gopls' or client.server_capabilities.semanticTokensProvider then
          return
        end

        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = {
            tokenTypes = semantic.tokenTypes,
            tokenModifiers = semantic.tokenModifiers,
          },
          range = true,
        }
      end,
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = mason_lsp_servers,
      automatic_enable = {
        exclude = vim.tbl_keys(servers or {}),
      },
    }
  end,
}
