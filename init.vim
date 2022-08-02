set number
set mouse=a

set laststatus=2

" Native fuzzy search for vim
" Append path to subfolders
set path+=**
" Display all matching files when tab complete
set wildmenu

set nohlsearch

set termguicolors
set t_Co=256
syntax on

set encoding=utf-8
set hidden
set cmdheight=2
set shortmess+=c
set relativenumber
set clipboard+=unnamedplus

" Ignore node_modules
set wildignore+=*/node_modules/*

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Shows modified lines on left column
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
" Dracula theme setup
Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_italic = 0
let g:dracula_colorterm = 0

Plug 'wavded/vim-stylus'
" Detect when file has been edited outside of vim
Plug 'djoshea/vim-autoread'
" Git Wrapper
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'pechorin/any-jump.vim'
" Configuring AsyncRun command
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8

"Yoink Plugin
Plug 'svermeulen/vim-yoink'
Plug 'tpope/vim-surround'

" Icon Support
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"SnipRun
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" LSP support
Plug 'wbthomason/packer.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'rmagatti/goto-preview'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-lualine/lualine.nvim'

Plug 'rafcamlet/tabline-framework.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'brenoprata10/nvim-highlight-colors'

" Lua plugin dev tool
Plug 'folke/lua-dev.nvim'

" Initialize plugin system
call plug#end()

lua << EOF
	require('lsp-ts-setup')
	require('lsp-lua-dev-setup')
	require('lualine-setup')
	require('notify-setup')
	require('tabline-setup')
	require('goto-preview').setup {}
	require('nvim-highlight-colors').setup {
		render = 'foreground'
	}
EOF

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Prettier<CR>
map <C-h> :FzfLua oldfiles path_shorten=3<CR>
map <C-r> :FzfLua files path_shorten=10<CR>
nmap gc :FzfLua git_commits<CR>
nmap gr :AnyJump<CR>
xmap gr :AnyJumpVisual<CR>
nnoremap <C-u> :UndotreeToggle<CR>

"Yoink mappings
nmap <c-a> <plug>(YoinkPostPasteSwapBack)
nmap <c-s> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

" Git vim-fugitive.
map <C-g> :Gvdiffsplit!<CR>
nnoremap glb :diffget //2<CR>
nnoremap grb :diffget //3<CR>

colorscheme dracula
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermbg=NONE
