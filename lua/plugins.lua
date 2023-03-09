-- vim.cmd [[packadd packer.nvim]]
-- local fn = vim.fn
-- local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
-- end

-- Install packer
local install_path = vim.fn. stdpath'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
 is_bootstrap = true
 vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
 vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Информационная строка внизу
  use "kyazdani42/nvim-web-devicons"
  use { 'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
      require('lualine').setup()
  end, }

  use ({"ellisonleao/gruvbox.nvim",
      as = 'gruvbox',
      config = function()
        --vim.cmd('colorscheme gruvbox')
        require('plugins_configs/gruvbox')
      end
    })

  --Образец цвета  
  use {'norcalli/nvim-colorizer.lua',
  	config = function()
		require('colorizer').setup()
	end
    }

  -- Подсказки хоткеев
  use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
    }
  end
}
  ---------------------------------------------------------
  -- МОДУЛИ РЕДАКТОРА
  ---------------------------------------------------------
  -- Табы с вкладками сверху
  use {'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
      	require("plugins_configs/bufferline")
  end, }

  -- Нормальное закрывание табов
  use 'famiu/bufdelete.nvim'

  -- Структура классов и функций в файле
  use 'majutsushi/tagbar'
  -- Файловый менеджер
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function ()
	require('plugins_configs/neo-tree')
	end
}
  -- GIT
  use {
  'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
}
  --- popup окошки
  use 'nvim-lua/popup.nvim'

  -- Сплиты
  use {'mrjones2014/smart-splits.nvim'}

  -- Терминал
  use {"akinsho/toggleterm.nvim", 
      tag = '*', 
      config = function()
        require("toggleterm").setup()
      end
    }
  ---------------------------------------------------------
  -- ПОИСК
  ---------------------------------------------------------
  -- Наш FuzzySearch
  use { 'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function() 
      require'telescope'.setup {}
  end, }
    
  ---------------------------------------------------------
  -- КОД
  ---------------------------------------------------------
  -- автоматические закрывающиеся скобки
  use { 'windwp/nvim-autopairs',
      config = function()
      require("nvim-autopairs").setup()
  end}
  -- Комментирует по <gc> все, вне зависимости от языка программирования
  use { 'numToStr/Comment.nvim',
      config = function() 
      require('Comment').setup() 
  end }

  ---------------------------------------------------------
  -- LSP И АВТОДОПОЛНЯЛКИ
  ---------------------------------------------------------

  use {
    "williamboman/mason.nvim",
    config = function()
      require('plugins_configs/mason')
    end
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('plugins_configs/mason_lspconfig')
    end
  }
  
  use 'neovim/nvim-lspconfig'
  -- use 'williamboman/nvim-lsp-installer'

  --- Автодополнлялка к файловой системе
  use 'hrsh7th/cmp-path'

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  -- Автодополнялка
  use {'hrsh7th/nvim-cmp',
      config = function()
        require('plugins_configs/nvim_cmp')
      end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'

  --Коллекции снипетов
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"


  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'

  -- Линтер, работает для всех языков
  use 'dense-analysis/ale'
  ---------------------------------------------------------
  -- РАЗНОЕ
  ---------------------------------------------------------
  -- Даже если включена русская раскладка, то nvim-команды будут работать
  use 'powerman/vim-plugin-ruscmd'


  if packer_bootstrap then
    require('packer').sync()
  end

end) -- Это не удалять
