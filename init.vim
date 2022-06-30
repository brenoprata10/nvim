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

" Coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
let g:coq_settings = { 'auto_start': 'shut-up', 'keymap': {'jump_to_mark': '<c-x>'} }

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

" Initialize plugin system
call plug#end()

lua << EOF
	require('lsp-ts-setup')
	require('lualine-setup')
	require('notify-setup')
	require('goto-preview').setup {}

	local render = function(f)

  f.make_tabs(function(info)
    -- With the help of kyazdani42/nvim-web-devicons we can fetch color
    -- associated with the filetype
    local icon_color = f.icon_color(info.filename)

    -- If this is the current tab then highlight it
    if info.current then
      -- We can use set_fg to change default fg color
      -- so you won't need to specify it every time
      f.set_fg(icon_color)
    end

    f.add( ' ' .. info.index .. ' ')

    if info.filename then
	    f.add(info.modified and '●')
      f.add{info.filename}

      -- The icon function returns a filetype icon based on the filename
      f.add(' ' .. f.icon(info.filename))
    else
      f.add(info.modified and '[+]' or '[-]')
    end
    f.add ' '
  end)

  -- Let's add a spacer wich will justify the rest of the tabline to the right
  f.add_spacer()

  -- get some info from lsp
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  -- and display it
  f.add { '  ' .. errors, fg = "#e86671" }
  f.add { '  ' .. warnings, fg = "#e5c07b"}
  f.add ' '
end
require('tabline_framework').setup { 
	render = render,
	-- Default color of tabline items: tabs/bufs
  -- if not set TF uses TabLine highlight group colors
  hl = { fg = "white" ,bg = "#323952" },
  -- Default color of everything except items
  -- if not set TF uses TabLineFill highlight group colors
  hl_fill = { fg = "#4b7384" ,bg ="#161421" },
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
