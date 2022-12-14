local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Packages for nvim
require("lazy").setup({
	 -- Theme
	'Yazeed1s/minimal.nvim',
	
	-- LSP Packages
  	"williamboman/mason.nvim",
   	"williamboman/mason-lspconfig.nvim",
   	"neovim/nvim-lspconfig",

	-- Code Autocompletion
	{"neoclide/coc.nvim", branch="release"},
    
    -- Treesitter
	"nvim-treesitter/nvim-treesitter",

    -- Git signs
    'lewis6991/gitsigns.nvim',
})
