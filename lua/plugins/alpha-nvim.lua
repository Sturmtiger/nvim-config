return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  config = function()
    local startify = require 'alpha.themes.startify'
    startify.file_icons.provider = 'devicons'
    require('alpha').setup(startify.config)
  end,
}
