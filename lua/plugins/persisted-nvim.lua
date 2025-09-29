return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre',
  config = function(_, opts)
    require('telescope').load_extension 'persisted'
    require('persisted').setup(opts)
  end,
  keys = {
    {
      '<leader>sp',
      function()
        -- It is safe because Telescope is loaded on the VimEnter event (which takes place earlier).
        local telescope = require 'telescope'
        telescope.extensions.persisted.persisted()
      end,
      desc = 'Sessions',
    },
  },
}
