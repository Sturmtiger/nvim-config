--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help.
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  require 'plugins.gitsigns',
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
  --
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.
  require 'plugins.which-key',
  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope',
  -- Colorscheme
  require 'plugins.tokyonight',
  -- Highlight TODOs, NOTEs etc.
  require 'plugins.todo-comments',
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-tree',
  require 'plugins.mini-nvim',
  -- LSP Plugins
  require 'plugins.lsp',
  require 'plugins.nvim-cmp',
  require 'plugins.conform-nvim',
  -- require 'plugins.debug',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
  -- require 'plugins.autopairs',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  -- None of my plugins use luarocks.
  rocks = {
    enabled = false,
  },
})
