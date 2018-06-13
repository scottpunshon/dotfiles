"
" Plugins
"
" To Install: from the command line run:
"   vim +PlugClean +PlugInstall +qall
"
silent! if plug#begin('~/.vim/bundle')


" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'

Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'

" Multi-Cursor
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" NERDTree
let g:NERDTreeMouseMode = 2
let g:use_nerdtreetabs=0
if g:use_nerdtreetabs
	Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
else
	"Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }  " on demand loading
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTree','NERDTreeToggle','NERDTreeOpen','NERDTreeFocus','NERDTreeFind','NERDTreeMirror'] }  " on demand loading
	"Plug 'scrooloose/nerdtree'
endif

" TagBar
if v:version >= 703
	Plug 'majutsushi/tagbar'
	"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
endif
let g:tagbar_autofocus = 1
let g:tagbar_width=30

" Colours
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'


call plug#end()
endif
