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
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=6 " Keep 6 lines below and above the cursor


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
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'tanvirtin/monokai.nvim'

 Plug 'nvim-lualine/lualine.nvim'

 Plug 'goolord/alpha-nvim'
 Plug 'morhetz/gruvbox'

 Plug 'thibthib18/ros-nvim'

 Plug 'numToStr/FTerm.nvim'

 Plug 'kyazdani42/nvim-web-devicons' " for file icons
 Plug 'kyazdani42/nvim-tree.lua'

 Plug 'junegunn/vim-peekaboo'

 Plug 'kdheepak/tabline.nvim'

call plug#end()


nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly


lua << EOF
require 'ros-nvim'.setup {
	-- path to your catkin workspace
	catkin_ws_path = "~/catkin_ws",
	-- terminal height for build / test
	terminal_height = 8
}
EOF

lua require('lualine').setup{options = {theme = 'gruvbox'}}

lua require('nvim-tree').setup{}

" Use deoplete.
let g:deoplete#enable_at_startup = 1


colorscheme gruvbox


luafile ~/.config/nvim/shortcuts/alpha.lua
luafile ~/.config/nvim/shortcuts/nvim-ros.lua
luafile ~/.config/nvim/shortcuts/fterm.lua
luafile ~/.config/nvim/shortcuts/tabline.lua


