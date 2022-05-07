vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig") -- Collection of configurations for the built-in LSP client

	use({ "junegunn/fzf", run = "fzf#install()" })
	use({
		"yuki-yano/fzf-preview.vim",
		opt = true,
		event = "VimEnter",
		branch = "release/rpc",
		requires = { "junegunn/fzf" },
		config = function()
			require("plugconfig/fzf_preview")
		end,
	})
	-- LSP settings
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugconfig/nvim_cmp")
		end,
	})
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
	use({
		"tzachar/cmp-tabnine",
		after = "nvim-cmp",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("plugconfig/cmp-tabnine")
		end,
	})

	-- use({
	-- 	"onsails/lspkind.nvim",
	-- 	after = "nvim-cmp",
	-- 	requires = "hrsh7th/nvim-cmp",
	-- 	config = function()
	-- 		require("plugconfig/lspkind")
	-- 	end,
	-- })
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		after = "nvim-cpm",
		requires = "hrsh7th/nvim-cmp",
	})
	use({
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		after = "nvim-cpm",
		config = function()
			require("plugconfig/vsnip")
		end,
	})
	-- format and linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugconfig/null_ls")
		end,
	})
end)
--vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])

-- 設定ファイルがアップデートしたら自動でコンパイルする
