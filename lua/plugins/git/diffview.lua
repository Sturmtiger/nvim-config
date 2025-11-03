return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gf', '<cmd>DiffviewFileHistory<CR>', desc = 'File history' },
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Diff view' },
  },
  opts = {
    default_args = {
      DiffviewFileHistory = { '%' },
    },
  },
}
