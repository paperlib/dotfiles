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
  "farmergreg/vim-lastplace",
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
      vim.cmd(" highlight SignColumn      ctermbg=NONE guibg=NONE ")
      vim.cmd(" highlight GitGutterAdd    ctermbg=NONE guibg=NONE ")
      vim.cmd(" highlight GitGutterChange ctermbg=NONE guibg=NONE ")
      vim.cmd(" highlight GitGutterDelete ctermbg=NONE guibg=NONE ")

      require("gitsigns").setup({
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
        enable_git_status  = true,

        -- the default unstaged icon seems to occupy 2 chars causing alignment issues.
        -- this is particularly apparent when within tmux. --------------------------.
        default_component_configs = { git_status = { symbols = { unstaged = 'u' } } }
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        highlight = { enable = true },
        indent    = { enable = true }
      })
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline"
    },
    config = function()
      local cmp = require 'cmp'

      -- this follows the <tab> / <s-tab> completion convention - which a lot don't like
      -- see tj devries for context: https://www.youtube.com/watch?v=_DnmphIwnjo
      -- other useful links:
      -- https://github.com/hrsh7th/nvim-cmp/discussions/1707
      cmp.setup({
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<cr>']      = cmp.mapping.confirm { select = false },
          ['<tab>']     = cmp.mapping.select_next_item(),
          ['<s-tab>']   = cmp.mapping.select_prev_item(),
          ['<c-space>'] = cmp.mapping.complete({
            -- on request completion
            -- when we manually (force) request completion
            -- we don't want the completion menu to disappear until we reach the "keyword_length"
            -- -> ie. if we did specifically ask for completion, keep it on.. don't damn disappear
            -- -> that means reset the "keyword_length" back to 1.
            config = {
              sources = {
                { name = 'buffer', trigger_characters = { '.' }, keyword_length = 1 }
              }
            }
          })
        }),
        sources = cmp.config.sources({
          { name = 'buffer', trigger_characters = { '.' }, keyword_length = 5 },
          { name = 'path', option = { get_cwd = function() return vim.fn.getcwd() end }   }
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline({
          ['<cr>'] = {
            -- don't feed whatever autocomplete has for us on <cr>
            -- -> rather "select" first and only then feed it in.
            c = function(default)
              if cmp.visible() then
                return cmp.confirm({ select = false })
              end

              default()
            end
          }
        }),
        sources = cmp.config.sources({
          { name = 'path'    },
          { name = 'cmdline', keyword_length = 3 }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateUp",
      "TmuxNavigateDown",
      "TmuxNavigateLeft",
      "TmuxNavigateRight"
    },
    keys = {
      { "<c-up>",    "<cmd>TmuxNavigateUp<cr>"    },
      { "<c-down>",  "<cmd>TmuxNavigateDown<cr>"  },
      { "<c-left>",  "<cmd>TmuxNavigateLeft<cr>"  },
      { "<c-right>", "<cmd>TmuxNavigateRight<cr>" }
    }
  }
})
