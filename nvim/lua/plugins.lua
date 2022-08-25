local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[colorscheme neosolarized]]
vim.cmd[[colorscheme tokyonight]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- startup screen
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  -- status line
  use 'nvim-lualine/lualine.nvim'
  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- lsp
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  -- Mason - lsp laguage manager
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- tabs decoration
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'windwp/nvim-autopairs' --autopairs
  use "lukas-reineke/indent-blankline.nvim" -- add indent line for vrackets
  use { -- aditional syntax highlights
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- autotag
  use 'windwp/nvim-ts-autotag'
  -- tokyo theme
  use 'folke/tokyonight.nvim'
  -- comments plugin
  use 'numToStr/Comment.nvim'
  use 'MunifTanjim/eslint.nvim'

  -- witch key
  use "folke/which-key.nvim"
  --toggle term
  use {"akinsho/toggleterm.nvim", tag = 'v2.*' }
  -- git signs
  use {
    'lewis6991/gitsigns.nvim',
  }
  use {
  'samodostal/image.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)

