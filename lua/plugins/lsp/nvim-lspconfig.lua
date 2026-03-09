return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim',       opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('sturm/lsp_attach', { clear = true }),
      callback = function(event)
        local keymap = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        keymap('grn', vim.lsp.buf.rename, 'Rename')
        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        keymap('gra', vim.lsp.buf.code_action, 'Execute code action', { 'n', 'x' })
        keymap('grr', require('telescope.builtin').lsp_references, 'Go to References')
        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        keymap('gri', require('telescope.builtin').lsp_implementations, 'Go to implementation')
        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        keymap('grd', require('telescope.builtin').lsp_definitions, 'Go to definition')
        keymap('grD', vim.lsp.buf.declaration, 'Go to declaration')

        keymap('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        keymap('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace (Project) Symbols')
        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        keymap('grt', require('telescope.builtin').lsp_type_definitions, 'Go to type definition')
        keymap('K', vim.lsp.buf.hover, 'Hover element under cursor')

        local lsp_methods = vim.lsp.protocol.Methods

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(lsp_methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('sturm/lsp_highlight', { clear = false })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('sturm/lsp_detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'sturm/lsp_highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client:supports_method(lsp_methods.textDocument_inlayHint, event.buf) then
          keymap('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, 'Toggle inlay hints')
        end
      end,
    })

    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- Enable the following language servers
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    -- pyright = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    -- ts_ls = {},

    vim.lsp.config('lua_ls', {
      -- cmd = { ... },
      -- filetypes = { ... },
      -- capabilities = {},
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    })
    -- TODO: Automate the installation process when creating `dotfiles` repo. 
    
    -- Mac: brew install ruff ty
    -- Arch: pacman -S ruff ty
    vim.lsp.enable({'ruff', 'ty'})
    -- lua_ls - installed via:
    -- Mac: brew install lua-language-server
    -- Arch: pacman -S lua-language-server
    vim.lsp.enable('lua_ls')

    vim.lsp.config('*', (require('blink.cmp').get_lsp_capabilities(nil, true)))
    local ensure_installed = vim.tbl_keys(servers or {})
    -- TODO: Dropped mason-tool-installer. Install formatters (e.g. stylua) in another way (or reinstall it).
  end,
}
