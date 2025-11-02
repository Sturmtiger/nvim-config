return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>gs', ':Neogit<CR>', desc = 'Neogit Status', silent = true },
    { '<leader>gc', ':Neogit commit<CR>', desc = 'Neogit Commit', silent = true },
    { '<leader>gp', ':Neogit pull<CR>', desc = 'Neogit Pull', silent = true },
    { '<leader>gP', ':Neogit push<CR>', desc = 'Neogit Push', silent = true },
  },
}
