vim.api.nvim_create_user_command('ToggleAutoFormat', function()
    vim.g.autoformat_disabled = not vim.g.autoformat_disabled

    vim.notify(string.format('Auto-format %s', vim.g.autoformat_disabled and 'disabled' or 'enabled'),
      vim.log.levels.INFO)
  end,
  { desc = 'Toggle auto-format' }
)
