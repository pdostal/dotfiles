-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- automatic rebuild on plugins.lua change
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
  ]])

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Remember last position when reopening files
  use 'ethanholz/nvim-lastplace'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
