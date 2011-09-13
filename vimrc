set background=dark

set spell spelllang=en_us

syntax on
filetype on
filetype plugin on
filetype indent on

set ts=4 sw=4 sts=4

set list listchars=tab:>-,trail:-
set number

map <F8> <ESC>:make<CR>
imap <F8> <ESC>:make<CR>a
map <F12> <ESC>:cn<CR>

set title
set history=1000

set scrolloff=3

set ruler
set showmatch
set incsearch
set hlsearch
set smartcase

set shortmess=atI

colorscheme torte

autocmd filetype python set expandtab

augroup nemerle
	au!
	autocmd BufNewFile,BufReadPre *.n
		\ set fencs=ucs-bom,utf-8,iso-8859-2 fenc=utf-8
augroup END

augroup Binary
	au!
	au BufReadPre   *.bin let &bin=1
	au BufReadPost  *.bin if &bin | %!xxd
	au BufReadPost  *.bin set ft=xxd | endif
	au BufWritePre  *.bin if &bin | %!xxd -r
	au BufWritePre  *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

if has("cscope")
	set cst
	set csto=0
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

let ComniCpp_MayCompleteDot=1
let ComniCpp_MayCompleteArrow=1
let ComniCpp_MayCompleteScope=1

set completeopt=longest,menu

set path+=.,/usr/include
" KDE-specific
set path+=/usr/include/KDE,/usr/include/qt4
" boost
set path+=/usr/include/boost

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

call pathogen#infect()
