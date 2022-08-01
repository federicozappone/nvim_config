set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set cindent                 " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " speed up scrolling in Vim
set scrolloff=6             " keep 6 lines below and above the cursor
set exrc                    " handle project specific .nvimrc file

" install vim-plug is not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim/'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin("~/.vim/plugged")

  Plug 'tpope/vim-commentary'
 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
 
  Plug 'nvim-lualine/lualine.nvim'
 
  " splash screen
  Plug 'goolord/alpha-nvim'
 
  Plug 'thibthib18/ros-nvim'
  Plug 'numToStr/FTerm.nvim'
 
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'romgrk/barbar.nvim'
 
  " lspconfig and mason
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  " nvim-cmp
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'ray-x/cmp-treesitter'

  " snippet engine
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " other stuffs
  Plug 'folke/trouble.nvim'
  Plug 'onsails/lspkind-nvim'

  " function signature
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " notify
  Plug 'rcarriga/nvim-notify'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 
  " themes
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'EdenEast/nightfox.nvim'
 
  Plug 'folke/which-key.nvim'
 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'tanvirtin/vgit.nvim'
 
  Plug 'lukas-reineke/indent-blankline.nvim'
 
call plug#end()


nnoremap <C-n> <cmd>NvimTreeToggle<CR>
nnoremap <leader>r <cmd>NvimTreeRefresh<CR>
nnoremap <leader>n <cmd>NvimTreeFindFile<CR>
nnoremap <leader>tc <cmd>NvimTreeCollapse<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>

nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>rf <cmd>Telescope oldfiles<cr>
nnoremap <leader>of <cmd>Telescope oldfiles<cr>

nnoremap <leader>vc <cmd>e $MYVIMRC<cr>
nnoremap <leader>ed <cmd>ene <BAR> startinsert <CR>

nnoremap <silent>gt <cmd>BufferNext<cr>
nnoremap <silent>GT <cmd>BufferPrevious<cr>
nnoremap <leader>cat <cmd>BufferCloseAllButCurrent<cr>


set termguicolors " this variable must be enabled for colors to be applied properly


colorscheme catppuccin


luafile ~/.config/nvim/luafiles/nvim-ros.lua
luafile ~/.config/nvim/luafiles/fterm.lua
luafile ~/.config/nvim/luafiles/nvim-treesitter.lua
luafile ~/.config/nvim/luafiles/nvim-cmp.lua
luafile ~/.config/nvim/luafiles/nvim-lspconfig.lua
luafile ~/.config/nvim/luafiles/nvim-notify.lua
luafile ~/.config/nvim/luafiles/mason.lua
luafile ~/.config/nvim/luafiles/which-key.lua
luafile ~/.config/nvim/luafiles/vgit.lua
luafile ~/.config/nvim/luafiles/ros-nvim.lua
luafile ~/.config/nvim/luafiles/lualine.lua
luafile ~/.config/nvim/luafiles/blankline.lua
luafile ~/.config/nvim/luafiles/nvim-tree.lua

