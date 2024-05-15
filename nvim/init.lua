--setting nvim stuff
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true

vim.cmd("autocmd FileType * setlocal noexpandtab");
vim.opt.list        = true
vim.opt.listchars   = "trail:·,nbsp:◇,tab:┊ ,extends:▸,precedes:◂"
vim.opt.expandtab   = true
vim.opt.swapfile    = false


local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")


-- installing packages
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'rebelot/kanagawa.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use {
    		"nvim-telescope/telescope.nvim",
    		tag = '0.1.6',
    		requires = {{'nvim-lua/plenary.nvim'}}
  	}
	use {
    		"nvim-telescope/telescope-file-browser.nvim",
    		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	use {
  		'nvimdev/dashboard-nvim',
  		event = 'VimEnter',
  		config = configDashboard,
  		requires = {'nvim-tree/nvim-web-devicons'}
	}
	use {
    		"windwp/nvim-autopairs",
    		event = "InsertEnter",
    		config = function()
        		require("nvim-autopairs").setup {}
    		end
	}
end)

-- loading kanagawa theme
require("kanagawa").load("wave")

-- loading lualine theme
local palenight_theme = require 'lualine.themes.kanagawa'
require('lualine').setup{
	options = {
		theme = palenight_theme
	},
}

-- loading tree sitter
require('nvim-treesitter').setup{
	highlight= {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

-- loading nvim-tree
require('nvim-tree').setup()

--loading nvim-web-devicons
require('nvim-web-devicons').setup()

--loading telescope
require('telescope').setup()

--loading telescope-file-browser
require('telescope').load_extension 'file_browser'

-- setting keymaps
vim.keymap.set('n', '<C-F>', ':NvimTreeToggle<CR>')
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

function configDashboard()
	require('dashboard').setup {
		theme = 'hyper',
	}
end

