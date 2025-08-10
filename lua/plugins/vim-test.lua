return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  init = function()
    vim.g['test#strategy'] = 'vimux'
  end,
  keys = {
    { '<leader>t', ':TestNearest<CR>', desc = '[T]est Nearest' },
    { '<leader>c', ':TestClass<CR>', desc = 'Test Class' }, -- Works with Pytest only
    { '<leader>T', ':TestFile<CR>', desc = '[T]est File' },
    { '<leader>a', ':TestSuite<CR>', desc = 'Test Suite' },
    { '<leader>l', ':TestLast<CR>', desc = 'Test Last' },
    --{ '<leader>g', ':TestVisit<CR>', desc = 'Open Last Test File' },
  },
}
