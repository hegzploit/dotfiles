return require('packer').startup(function(use)
   -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'bluz71/vim-moonfly-colors'
  use 'xiyaowong/nvim-transparent'
  use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  -- File Explorer
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons
  -- others
  use 'norcalli/nvim-colorizer.lua'
end)
