-- Formatting
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      if vim.g.autoformat_disabled then
        return
      end

      return {
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  init = function()
    -- Use conform for gq.
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- Start auto-formatting by default. Can be disabled with user ToggleFormat command.
    vim.g.autoformat_disabled = false
  end
}
