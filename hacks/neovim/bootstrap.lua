vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- set the signcolumn to the right of the number column
-- https://www.reddit.com/r/neovim/comments/14yjoyh/how_to_get_gitsigns_or_equivalent_to_the_right_of
-- https://www.reddit.com/r/neovim/comments/107ms1s/the_new_signcolumn_merge_allows_us_to_set_a
vim.opt.statuscolumn = '%=%l%s%C'

-- and because of the above, lets keep the sign column around (always)
vim.opt.signcolumn = 'yes'

-- yes I want a g*damn blinking cursor ------.
vim.opt.guicursor:append('a:blinkon1') -- WTF.

-- in neovim >0.9 pastetoggle has been deprecated
-- *but* we do have cases where the 'Just Paste It(tm)' doesn't work:
-- https://stackoverflow.com/questions/76687544/emulate-pastetoggle-in-neovim
-- luckily `paste` while deprecated still works, so this is a workaround of sorts
-- for more details see: https://vimhelp.org/options.txt.html#%27paste%27
vim.keymap.set('n', '<f5>', '<cmd>:set paste!<cr>', { noremap = true, silent = true })
vim.keymap.set('i', '<f5>', '<cmd>:set paste!<cr>', { noremap = true, silent = true })

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
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        vim.cmd(" highlight SignColumn      ctermbg=NONE guibg=NONE "),
        vim.cmd(" highlight GitGutterAdd    ctermbg=NONE guibg=NONE "),
        vim.cmd(" highlight GitGutterChange ctermbg=NONE guibg=NONE "),
        vim.cmd(" highlight GitGutterDelete ctermbg=NONE guibg=NONE "),

        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        }
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader><leader>",      ":Neotree filesystem toggle left<cr>", { silent = true })
      vim.keymap.set("v", "<leader><leader>", "<esc>:Neotree filesystem toggle left<cr>", { silent = true })

      vim.keymap.set("n", "<leader>gg", ":Neotree float git_status<cr>", { silent = true })

      require("neo-tree").setup({
        filesystem = { follow_current_file = { enabled = true, leave_dirs_open = true } },
        buffers    = { follow_current_file = { enabled = true, leave_dirs_open = true } },
        popup_border_style = "rounded",
        enable_git_status  = true
      })
    end
  }
})
