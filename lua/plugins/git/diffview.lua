return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gf', '<cmd>DiffviewFileHistory<CR>', desc = 'File history' },
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diff view' },
  },
  -- TODO: Configure custom `icons` and `signs` if needed.
  -- TODO: Configure `hooks` for `miniclue` if you decide to migrate from `which-key`
  opts = {
    default_args = {
      DiffviewFileHistory = { '%' },
    },
  },
  -- TODO: Configure keymaps once you feel what you need.
  -- keymaps = {
  --   disable_defaults = true,
  --   view = {
  --     { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
  --     { 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
  --   },
  -- },
}
