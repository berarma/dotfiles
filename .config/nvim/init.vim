call plug#begin('~/.local/share/nvim/plugged')
Plug 'tommcdo/vim-exchange'
Plug 'preservim/vim-wordy'
Plug 'preservim/vim-lexical'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && ./install.sh' }
Plug 'habamax/vim-godot'
Plug 'mfussenegger/nvim-dap'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Konfekt/FastFold'
if has('python3')
    Plug 'SirVer/ultisnips'
endif
Plug 'mileszs/ack.vim'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/colorizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
"if v:version >= 800
"    Plug 'lvht/phpcd.vim', { 'for': 'php', 'branch': 'php5', 'do': 'composer install' }
"endif
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mtth/scratch.vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-liquid'
if has('python3')
    Plug 'vim-vdebug/vdebug'
endif
Plug 'morhetz/gruvbox'
"Plug 'w0rp/ale'
call plug#end()

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

set nocompatible
filetype indent plugin on
syntax on
syntax sync minlines=256

set autoindent
set background=dark
set backspace=indent,eol,start
set breakindent
set complete-=i
set confirm
set encoding=utf-8
set expandtab
set foldcolumn=3
set foldlevelstart=1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list listchars=tab:‣·,eol:.,trail:·,nbsp:␣ 
set noshowmode
set nostartofline
set notimeout ttimeoutlen=0
set number
set pastetoggle=<F11>
set path=.,, " Remove extra directories from file search path
set ruler
set scrolloff=2
set shiftwidth=4
set sidescrolloff=5
set smartcase
set softtabstop=4
set tabstop=4
set undofile
set visualbell
set wildmenu
set termguicolors

" Vim settings
set t_vb=

" Colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
silent! colorscheme gruvbox

" Set color for tabs
" vim
hi SpecialKey ctermfg=237 ctermbg=NONE guifg=gray30 guibg=NONE
" nvim
hi WhiteSpace ctermfg=237 ctermbg=NONE guifg=gray30 guibg=NONE

" Set font for gui version
set guifont=Terminus

" Set space between lines in gui version
set linespace=2

" Don't use the Alt key for menus in gui version
set winaltkeys=no

" Remove menu and toolbar
set guioptions-=mT

" Buffer navigation
nmap <S-Tab> :bp<CR>
nmap <TAB> :bn<CR>

" Set Space as leader key
let mapleader="\<Space>"
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" Setup PHP folding
let g:php_folding=1
let g:PHP_outdentphpescape = 0
let g:PHP_noArrowMatching = 1

" Don't load NetRW plugin
let loaded_netrwPlugin = 1

" Plugins for markdown
let g:pencil#autoformat_config = {
            \   'liquid': {
            \     'black': [
            \       'yaml*',
            \       'liquid*',
            \     ],
            \   },
            \}
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType markdown,mkd call lexical#init()
augroup END

" Airline config
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" ctrlp.vim config
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l -U --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif

" indent-guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_tab_guides = 0

" CoC
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-css',
    \'coc-html',
    \'coc-java',
    \'coc-json',
    \'coc-markdownlint',
    \'coc-phpls',
    \'coc-pyright',
    \'coc-tsserver',
    \'coc-yaml'
    \]

" Godot
"let g:godot_executable = '/usr/local/bin/godot'

" Generic bindings
inoremap <C-c> <Esc>

" Ack: highlight search term
let g:ackhighlight = 1
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Tagbar: don't show variables
let g:tagbar_type_php  = {
      \ 'ctagstype' : 'php',
      \ 'kinds'     : [ 'i:interfaces', 'c:classes', 'd:constant definitions', 'f:functions', 'j:javascript functions:1' ]
      \ }
nmap <F8> :TagbarToggle<CR>

" Colorizer config
let g:colorizer_auto_filetype='html,css,less'

"
" From http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction
" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

"runtime ./coc.vim

" Load .vimrc.local
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
