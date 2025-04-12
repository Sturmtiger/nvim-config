-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- As of 0.10 vim.loop is deprecated in favor of vim.uv (https://github.com/neovim/neovim/pull/22846)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
-- TODO: Check out this comment: https://www.reddit.com/r/neovim/comments/1cvrilk/comment/l4vyt5p/
vim.opt.rtp:prepend(lazypath)
