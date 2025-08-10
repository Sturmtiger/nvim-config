return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = '[E]xplore Tree' },
  },
  opts = {},
}
