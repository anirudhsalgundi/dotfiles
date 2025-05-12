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

-- Initialize lazy.nvim
require('lazy').setup({
  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "cpp", "python", "bash", "lua", "vim", "vimdoc", "json", "yaml", "html", "css", "javascript", "typescript", "markdown" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end
  },
  
  -- GitHub theme
  {
    'projekt0n/github-nvim-theme',
    priority = 1000,  -- Load theme early
    config = function()
      require('github-theme').setup({
        options = {
          styles = {
            functions = 'italic',
          },
          darken = {
            sidebars = {
              enable = true,
            }
          }
        }
      })
      vim.cmd('colorscheme github_dark_dimmed')
    end
  },
}, {
  -- Disable luarocks to avoid warnings
  rocks = {
    enabled = false
  }
})

-- Key mappings for copy/paste
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

