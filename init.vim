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
set signcolumn=yes:1

vnoremap p "_dP
map <Enter> o<ESC>
map <S-Enter> O<ESC>
nnoremap <C-A> gg0VG$

" install vim-plug is not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim/'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin("~/.vim/plugged")

    " Plug 'tpope/vim-commentary'
    Plug 'terrortylor/nvim-comment'
   
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
   
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

    " automatic documentation generation
    Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }

    " auto brackets and stuffs
    Plug 'windwp/nvim-autopairs'

    " collection of snippets
    Plug 'rafamadriz/friendly-snippets'

    " formatting
    Plug 'sbdchd/neoformat'

call plug#end()



nnoremap <C-n> <cmd>NvimTreeToggle<cr>
nnoremap <leader>r <cmd>NvimTreeRefresh<cr>
nnoremap <leader>n <cmd>NvimTreeFindFile<cr>
nnoremap <leader>tc <cmd>NvimTreeCollapse<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>

nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>rf <cmd>Telescope oldfiles<cr>
nnoremap <leader>of <cmd>Telescope oldfiles<cr>

nnoremap <leader>vc <cmd>e $MYVIMRC<cr>
nnoremap <leader>ed <cmd>ene <BAR> startinsert <cr>

nnoremap <leader>sh <cmd>ClangdSwitchSourceHeader<cr>
nnoremap <leader>qf <cmd>lua vim.lsp.buf.code_action()<cr>


set termguicolors " this variable must be enabled for colors to be applied properly
colorscheme catppuccin


luafile ~/.config/nvim/luafiles/barbar.lua
luafile ~/.config/nvim/luafiles/blankline.lua
luafile ~/.config/nvim/luafiles/fterm.lua
luafile ~/.config/nvim/luafiles/lualine.lua
luafile ~/.config/nvim/luafiles/mason.lua
luafile ~/.config/nvim/luafiles/nvim-cmp.lua
luafile ~/.config/nvim/luafiles/nvim-lspconfig.lua
luafile ~/.config/nvim/luafiles/nvim-notify.lua
luafile ~/.config/nvim/luafiles/nvim-ros.lua
luafile ~/.config/nvim/luafiles/nvim-tree.lua
luafile ~/.config/nvim/luafiles/nvim-treesitter.lua
luafile ~/.config/nvim/luafiles/ros-nvim.lua
luafile ~/.config/nvim/luafiles/trouble.lua
luafile ~/.config/nvim/luafiles/vgit.lua
luafile ~/.config/nvim/luafiles/which-key.lua
luafile ~/.config/nvim/luafiles/setups.lua
luafile ~/.config/nvim/luafiles/neoformat.lua


" this is to set the comment string to // for C++ files
" when you enter a (new) buffer
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.cc,*.ipp,*.hpp,*.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
" when you've changed the name of a file opened in a buffer, the file type may have changed
autocmd BufFilePost *.cc,*.ipp,*.hpp,*.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END

" FPP syntax
au Bufread,BufNewFile *.fpp{,i} set filetype=fpp

