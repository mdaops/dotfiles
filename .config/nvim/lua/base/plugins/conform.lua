return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters = {
      sqlfluff = {
        args = { 'fix', '--dialect', 'postgres', '-' },
        require_cwd = false,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      mdx = { 'prettier' },
      go = { 'goimports', 'gofumpt' },
      terraform = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      sql = { 'sqlfluff' },
    },
  },
}
