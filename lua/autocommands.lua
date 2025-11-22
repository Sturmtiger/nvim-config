-- See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('sturm/highlight_yank', { clear = true }),
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistedSavePre',
  callback = function()
    require('nvim-tree.api').tree.close()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('sturm/treesitter_folding', { clear = true }),
  desc = 'Enable Treesitter folding',
  callback = function(args)
    local bufnr = args.buf

    if vim.bo[bufnr].filetype ~= 'bigfile' and pcall(vim.treesitter.start, bufnr) then
      vim.api.nvim_buf_call(bufnr, function()
        vim.wo[0][0].foldmethod = 'expr'
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      end)
    end
  end,
})
