return {
  'goolord/alpha-nvim',
  lazy = false,
  config = function()
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', '<cmd>enew<CR>'),
      dashboard.button('r', '  Recently used files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('f', '󰈞  Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('s', '󱙋  Manage sessions', '<cmd>Telescope persisted<CR>'),
      dashboard.button('c', '  Update plugins', '<cmd>Lazy sync<CR>'),
      dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
    }
    require('alpha').setup(dashboard.config)
  end,
}
