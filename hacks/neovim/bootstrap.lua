vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- yes I want a g*damn blinking cursor ------.
vim.opt.guicursor:append('a:blinkon1') -- WTF.

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "machakann/vim-sandwich",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",

  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl",
    opts = { indent = { char = "│" }, scope = { show_start = false } }
  }
})
