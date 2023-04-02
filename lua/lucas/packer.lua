vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use({
	'rose-pine/nvim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
	})
	use({
	 'nvim-telescope/telescope.nvim', tag = '0.1.1',
	requires = { {'nvim-lua/plenary.nvim'} }
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('mbbill/undotree')	   
	use('tpope/vim-fugitive')
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {                                      -- Optional
	      'williamboman/mason.nvim',
	      run = function()
		pcall(vim.cmd, 'MasonUpdate')
	      end,
	    },
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},     -- Required
	    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	    {'L3MON4D3/LuaSnip'},     -- Required
	  }
	}
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


  use {
    'nvim-tree/nvim-tree.lua',

    config = function()
      require("nvim-tree").setup {}
    end
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  use('luk400/vim-jukit')
end)	  
