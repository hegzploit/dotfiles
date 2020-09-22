" theme settings
let &t_8f = "\<Esc>[41;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set background=dark
set t_Co=254

syntax on
colorscheme arctic

set ruler
set laststatus=2
set noshowmode 
set linebreak
set hidden
set cursorline

" compatibility
set nocompatible
filetype on

call plug#begin()
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/goyo.vim'
	Plug 'easymotion/vim-easymotion'
	Plug 'haya14busa/incsearch.vim'
	Plug 'haya14busa/incsearch-easymotion.vim'
	Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
" You'll need vim-sexp too for selecting forms.
	Plug 'guns/vim-sexp'
" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
	Plug 'tpope/vim-sexp-mappings-for-regular-people'
	Plug 'frazrepo/vim-rainbow'
	Plug 'tpope/vim-surround'
call plug#end()

let g:scheme_executable = "racket -I sicp"
au FileType scm call rainbow#load()
let maplocalleader = " "

"search
:set nohlsearch

" tabs
set tabstop=4
set shiftwidth=4
set autoindent
set noexpandtab

" backups
set nobackup
set noswapfile

" statusbar
set laststatus=2
set noshowmode

" line nums
set nu rnu

" text wrap
set wrap



" map search to incsearch-easymotion
function! s:incsearch_config(...) abort
	  return incsearch#util#deepextend(deepcopy({
	    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	    \   'keymap': {
	    \     "\<CR>": '<Over>(easymotion)'
	    \   },
	    \   'is_expr': 0
	    \ }), get(a:, 1, {}))
  endfunction

  noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
  noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
  noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

  " nuaNce's statusline
hi Sl1 ctermfg=none cterm=none ctermbg=NONE
hi Sl2 ctermfg=none cterm=none ctermbg=NONE
hi Sl3 ctermfg=none cterm=none ctermbg=NONE
hi Slrese ctermfg=none cterm=none ctermbg=none
function! RedrawMode(mode)
    if a:mode == 'n'
        return 'normal mode'
    elseif a:mode == 'i'
        return 'insert mode'
    elseif a:mode == 'R'
        return 'replace mode'
    elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
        return 'visual mode'
    elseif a:mode == 'c'
        return 'command mode'
    elseif a:mode == 't'
        return 'trace mode'
    endif
    return ''
endfunction


function! SetModifiedSymbol(modified)
    if a:modified == 1
        return '// unsaved'
    else
        return ''
    endif
endfunction


function! SetFiletype(filetype)
    if a:filetype == ''
        return 'txt'
    else
        return a:filetype
    endif
endfunction

set statusline=%#Slrese#\ %{RedrawMode(mode())}\ %#Sl1#
set statusline+=%#Sl3#%{SetModifiedSymbol(&modified)}
set statusline+=%#SlRese#
set statusline+=%=
set statusline+=%#Sl2#\ %.20t\ //
set statusline+=\%#Sl2#\ %l,%c
