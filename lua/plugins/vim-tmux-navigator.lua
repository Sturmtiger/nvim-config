-- Seamless navigation between nvim and tmux panes.
return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', { desc = 'Move focus to the left window' } },
    { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', { desc = 'Move focus to the lower window' } },
    { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', { desc = 'Move focus to the upper window' } },
    { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', { desc = 'Move focus to the right window' } },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', { desc = 'Move focus to the previous window' } },
  },
}
