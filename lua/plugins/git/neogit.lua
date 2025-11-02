return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>gs', '<cmd>Neogit<CR>', desc = 'Neogit Status' },
    { '<leader>gc', '<cmd>Neogit commit<CR>', desc = 'Neogit Commit' },
    { '<leader>gp', '<cmd>Neogit pull<CR>', desc = 'Neogit Pull' },
    { '<leader>gP', '<cmd>Neogit push<CR>', desc = 'Neogit Push' },
  },
}
