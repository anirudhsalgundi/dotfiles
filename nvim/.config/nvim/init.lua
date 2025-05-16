-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- 4 spaces for a tab
vim.opt.softtabstop = 4       -- 4 spaces when editing
vim.opt.shiftwidth = 4        -- 4 spaces for each indent level
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.termguicolors = true  -- Enable true color support
vim.opt.syntax = "on"         -- Enable syntax highlighting
vim.opt.cursorline = true     -- Highlight current line
vim.opt.number = true         -- Show line numbers

-- Initialize lazy.nvim
require('lazy').setup({
  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 
          "c", "cpp", "python", "bash", "lua", "vim", "vimdoc", 
          "json", "yaml", "html", "css", "javascript", "typescript", 
          "markdown", "regex", "comment", "toml", "query"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end
  },
  
  -- GitHub theme with enhanced syntax highlighting
  {
    'projekt0n/github-nvim-theme',
    priority = 1000,  -- Load theme early
    config = function()
      require('github-theme').setup({
        options = {
          -- Enhanced syntax highlighting settings
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
            functions = 'bold',
            strings = 'NONE',
            variables = 'NONE',
          },
          darken = {
            sidebars = {
              enable = true,
            },
            floats = true,
          },
          -- Increase contrast for better readability
          specs = {
            github_dark_dimmed = {
              syntax = {
                keyword = "#FF7B72",
                variable = "#D2A8FF",
                string = "#A5D6FF",
                function_ = "#FF6700",
                comment = "#768390",
                constant = "#79C0FF",
                number = "#79C0FF",
                type = "#7EE787",
                operator = "#FF7B72",
              },
            },
          },
        }
      })
      vim.cmd('colorscheme github_dark_default')
    end
  },
--   -- GitHub theme with enhanced syntax highlighting
-- {
--   'projekt0n/github-nvim-theme',
--   priority = 1000,  -- Load theme early
--   config = function()
--     require('github-theme').setup({
--       options = {
--         -- Theme options
--         transparent = false,
--         terminal_colors = true,
--         styles = {
--           comments = 'italic',
--           keywords = 'bold',
--           types = 'italic,bold',
--           functions = 'bold',
--           strings = 'NONE',
--           variables = 'NONE',
--         },
--         darken = {
--           sidebars = {
--             enable = true,
--           },
--           floats = true,
--         },
--       }
--     })
--     vim.cmd('colorscheme github_dark_default')
--   end
-- },


  -- Better highlighting for function arguments
  {
    'm-demare/hlargs.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true
  },
  
  -- Improved indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require("ibl").setup {
        indent = { char = "▏" },
        scope = { enabled = true },
      }
    end
  },
  
  -- Enhanced syntax highlighting for many languages
  {
    'sheerun/vim-polyglot',
    init = function()
      vim.g.polyglot_disabled = {'sensible'}
    end
  },
  
  -- Colorize color codes
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
}, {
  -- Disable luarocks to avoid warnings
  rocks = {
    enabled = false
  }
})

-- Key mappings for copy/paste
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true, silent = true })

-- Additional syntax highlighting enhancements
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python", "javascript", "typescript", "lua"},
  callback = function()
    -- Enhance specific language settings
    vim.opt_local.colorcolumn = "88"
  end,
})

-- Force re-read syntax highlighting for better results
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("syntax sync fromstart")
  end,
})

