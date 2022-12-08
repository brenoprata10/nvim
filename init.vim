set number "To display line numbers along the left side of a window
set mouse=a "Add mouse support (scrolling, copy)

set laststatus=2 "To display the status line always

" Native fuzzy search for vim
" Append path to subfolders
set path+=**

set wildmenu "Display all matching files when tab complete

set nohlsearch "Stop highlighting all matches to a search

set termguicolors
set t_Co=256
syntax on

set encoding=utf-8
set hidden
set cmdheight=2
set shortmess+=c
set relativenumber

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

Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Shows modified lines on left column
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
" Dracula theme setup
Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_italic = 0
let g:dracula_colorterm = 0

Plug 'wavded/vim-stylus'
Plug 'petertriho/nvim-scrollbar'
" Detect when file has been edited outside of vim
Plug 'djoshea/vim-autoread'
" Git Wrapper
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
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
let g:vsnip_snippet_dir = "~/.config/nvim/snippets"

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
Plug 'ray-x/lsp_signature.nvim'

Plug 'folke/trouble.nvim'

" Lua plugin dev tool
Plug 'folke/lua-dev.nvim'

" Initialize plugin system
call plug#end()

lua << EOF
	require('nvim-cmp-setup')
	require('lsp-ts-setup')
	require('lsp-lua-dev-setup')
	require('lualine-setup')
	require('notify-setup')
	require('tabline-setup')
	require("scrollbar").setup()
	require('goto-preview').setup {}
	require('nvim-highlight-colors').setup {
		enable_tailwind = true
	}
	require('trouble').setup {}
	require('lsp_signature').setup {
		hint_enable = false
	}
EOF

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Prettier<CR>
map <C-h> :FzfLua oldfiles path_shorten=3<CR>
map <C-r> :FzfLua files path_shorten=10<CR>
nmap gc :FzfLua git_commits<CR>
nmap gr :FzfLua lsp_references<CR>
xmap gr :FzfLua grep_visual<CR>
nmap gy :FzfLua lsp_definitions<CR>
nmap gl :FzfLua live_grep_resume<CR>
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

" trouble
nnoremap tt <cmd>TroubleToggle<cr>

colorscheme dracula
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermbg=NONE
