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

" Ignore node_modules
set wildignore+=*/node_modules/*

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

call plug#begin('~/.vim/plugged')

Plug 'jaxbot/semantic-highlight.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Shows modified lines on left column
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
" Dracula theme setup
Plug 'Mofiqul/dracula.nvim'
let g:dracula_transparent_bg = v:true

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

" Coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
let g:coq_settings = { 'auto_start': 'shut-up', 'keymap': {'jump_to_mark': 'null'} }

" LSP support
Plug 'wbthomason/packer.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'rmagatti/goto-preview'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-lualine/lualine.nvim'

Plug 'romgrk/barbar.nvim'
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.animation = v:true
let bufferline.tabpages = v:false

" Initialize plugin system
call plug#end()

lua << EOF
	require('lsp-ts-setup')
	require('null-ls-setup')
	require('lualine-setup')
	require('notify-setup')
	require('barbar-setup')
	require('goto-preview').setup {}

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

nnoremap <silent> < :BufferMovePrevious<CR>
nnoremap <silent> > :BufferMoveNext<CR>
nnoremap <silent> <gt1> <Cmd>BufferGoto 1<CR>
nnoremap <silent> <gt2> <Cmd>BufferGoto 2<CR>
nnoremap <silent> <gt3> <Cmd>BufferGoto 3<CR>
nnoremap <silent> <gt4> <Cmd>BufferGoto 4<CR>
nnoremap <silent> <gt5> <Cmd>BufferGoto 5<CR>
nnoremap <silent> <gt6> <Cmd>BufferGoto 6<CR>
nnoremap <silent> <gt7> <Cmd>BufferGoto 7<CR>
nnoremap <silent> <gt8> <Cmd>BufferGoto 8<CR>
nnoremap <silent> <gt9> <Cmd>BufferGoto 9<CR>
nnoremap <silent> <gT> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <gt> <Cmd>BufferMoveNext<CR>

colorscheme dracula
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermbg=NONE
