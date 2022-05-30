vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  --use({ "junegunn/fzf", run = ":call fzf#install()" })

  -- fizzy finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("plugconfig/telescope")
    end,
  })

  -- LSP settings
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugconfig/nvim_cmp")
    end,
  })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-emoji" })
  use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
  use({ "hrsh7th/cmp-vsnip" })
  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    config = function()
      require("plugconfig/cmp-tabnine")
    end,
    pluins,
  })

  use({
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("plugconfig/neogit")
    end,
    -- opt = true,
    -- event = "VimEnter",
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
  })
  -- use({
  -- 	"hrsh7th/cmp-vsnip",
  -- 	"hrsh7th/vim-vsnip",
  -- 	after = "nvim-cpm",
  -- 	config = function()
  -- 		require("plugconfig/vsnip")
  -- 	end,
  -- })
  use({
    "hrsh7th/vim-vsnip",
    config = function()
      require("plugconfig/vsnip")
    end,
    requires = {
      { "hrsh7th/vim-vsnip-integ" },
    },
  })
  --use({ "hrsh7th/cmp-vsnip", after = "nvim-cpm" })
  -- format and linter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugconfig/null_ls")
    end,
  })
  --use({"lambdalisue/fern.vim" , opt = true, cmd = {'Fern'}})
  use({
    "lambdalisue/fern.vim",
    opt = true,
    event = "VimEnter",

    config = function()
      require("plugconfig/fern")
    end,
  })
  use({ "lambdalisue/fern-git-status.vim", after = "fern.vim" })
  -- use({ "lambdalisue/nerdfont.vim", after = "fern.vim" })
  use({ "lambdalisue/fern-renderer-nerdfont.vim", after = "fern.vim", requires = { "lambdalisue/nerdfont.vim" } })
  use({ "lambdalisue/glyph-palette.vim", after = "fern.vim" })
  use({ "lambdalisue/fern-bookmark.vim", after = "fern.vim" })
  use({
    "t9md/vim-quickhl",
    opt = true,
    event = "VimEnter",
    config = function()
      require("plugconfig/vim_quichl")
    end,
  })
  use({
    "terryma/vim-expand-region",
    opt = true,
    event = "VimEnter",
    config = function()
      require("plugconfig/vim_expand_region")
    end,
  })
  use({ "segeljakt/vim-silicon", opt = true, event = "VimEnter" })
  -- colorschem
  use({ "dracula/vim", as = "dracula" })
  --use("rebelot/kanagawa.nvim")

  -- use({
  --   "vim-scripts/vim-auto-save",
  --   opt = true,
  --   event = "VimEnter",
  --   config = function()
  --     require("plugconfig/vim_auto_save")
  --   end,
  -- })

  use({
    "Pocco81/AutoSave.nvim",
    config = function()
      require("plugconfig/auto_save_nvim")
    end,
    opt = true,
    event = "VimEnter",
  })

  use({
    "vim-jp/vimdoc-ja",
    config = function()
      require("plugconfig/vimdoc_ja")
    end,
  })
  -- terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v1.*",
    opt = true,
    event = "VimEnter",
    config = function()
      require("plugconfig/toggleterm")
    end,
  })

  use({ "vim-denops/denops.vim" })
  --use({ "lambdalisue/gina.vim"  })
  -- use({
  --   "alvan/vim-closetag",
  --   config = function()
  --     require("plugconfig/vim_closetag")
  --   end,
  -- })

  -- use({
  --   "rchaser53/insertclosetag",
  --   config = function()
  --     require("plugconfig/insertclosetag")
  --   end,
  -- })
  use({
    "steelsojka/pears.nvim",
    config = function()
      require("plugconfig/pears")
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugconfig/indent_blankline")
    end,
  })
  -- treesitter settins
  use({
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    event = "VimEnter",
    run = ":TSUpdate",
    config = function()
      require("plugconfig/treesitter")
    end,
  })
  use({ "p00f/nvim-ts-rainbow" ,after = "nvim-treesitter"})
  
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  use({
    "lewis6991/gitsigns.nvim",
    opt = true,
    event = "VimEnter",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({ "MunifTanjim/nui.nvim" })

  use({
    "nvim-lualine/lualine.nvim",
    opt = true,
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("plugconfig/lualine")
    end,
  })
  use({
    "echasnovski/mini.nvim",
    branch = "stable",
    config = function()
      require("plugconfig/mini")
    end,
  })
  use("tversteeg/registers.nvim")
  use({
    "folke/which-key.nvim",
    opt = true,
    event = "vimenter",
    config = function()
      require("plugconfig/whichi_key")
    end,
  })
  use("ryanoasis/vim-devicons")
  use({
    "relastle/vim-colorrange",
    opt = true,
    event = "VimEnter",
  })
  use({ "lilydjwg/colorizer", opt = true, event = "VimEnter" })
  use({ "machakann/vim-highlightedyank" })

  use({ "t9md/vim-choosewin", opt = true, event = "VimEnter" })

  use({ "davidgranstrom/nvim-markdown-preview" , opt = true,event = "VimEnter"})
  
  -- file tree
end)
--vim.cmd([[autocmd BufWritePost config/plugins.lua PackerCompile]])

-- 設定ファイルがアップデートしたら自動でコンパイルする
