" Key binding
" <F1>: <ESC>
" <F2>: Grep
" <F3>: Toggle NERDTree
" <F4>: Toggle Quickview
" <F5>: make/run
" <F6>: alt make/run
" <F7>: Toggle Tlist
" <C-F7>: shell
" <F8>: Fold/Un-Fold
" tt/<C-t>: create new tab
" tc: close current tab
" tn/tp: next buffer, prev buffer
" tn/tp: next tab, prev tab
" {N}gt: goto the Nth tab
" wh,wj,wk,wl: window nav
" gp: format chinese paragraph
" <leader>ff: JSBeautify
" <C-_>: close matching open tag
" <C-y>,: Expand Abbreviation
"
" Commands and Functions
" :call StripTrailingWhite():  remove all trailing white spaces.
" :Matrix: Matrix

" General settings
set fileencodings=utf-8,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
if has("win32")
    set termencoding=cp936
    language messages zh_CN.UTF-8
endif

set nocp
set ru
set cin
" subtitute with magic
set sm
" auto indent
set ai

" for golang
set rtp+=$GOROOT/misc/vim

syntax on
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
filetype plugin on
filetype indent on

" tab stop & shift width
set shiftwidth=2
set tabstop=2
set softtabstop=2
" tab settings for different file types
" and 
" display TAB character as <+++ for some type.
"set list
"set list listchars=tab:<+
autocmd FileType python,javascript,c setlocal et sta sw=4 ts=4 sts=4 list listchars=tab:<+
autocmd FileType coffee setlocal et sta sw=2 ts=2 sts=2 list listchars=tab:<+ nocindent
autocmd FileType html,css setlocal sw=2 ts=2 sts=0 si sta nocindent
autocmd FileType go setlocal sta sw=4 ts=4 sts=4

" code fold
autocmd FileType python,coffee setlocal foldmethod=indent
set foldlevel=99
map <F8> za

" show line number
set number

" Show line Number
" affect indent in C program
" :0, indent of switch(), 0
" g0, indent of c++ scope declarations, 0
set cinoptions=:0g0(sus
" linebreak, when the 'wrap' is on, display a character in 'breakat' rather
" than at the last character that fits on screen
set lbr
" hlsearch, Highlight all items matched by search pattern
set hls
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
" create a fold for the lines in {range} ?
set fo+=mB
set mousemodel=popup
" last character will be included in selection
set selection=inclusive
" command-line completion operates...
set wildmenu
set smarttab
" Use twice the width of ASCII characters in Unicode encoding
set ambiwidth=double
" name of tags file
set tags=tags; 
" 这个命令让vim首先在当前目录里寻找tags文件, 否则再向父目录找
set autochdir

set mouse=a         "控制台启用鼠标

set nocompatible

highlight Pmenu guibg=#6311b0 
highlight PmenuSel guibg=#bac2ff gui=bold guifg=#000000

" Move lines
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>
imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>
vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

" Toggle spell check
" For VIM7 only
nmap <C-F11> :set spell!<CR>
imap <C-F11> <C-o>:set spell!<CR>

" Window Movement
nmap wn <C-w>n
nmap wv <C-w>v
nmap wh <C-w>h
nmap wj <C-w>j
nmap wk <C-w>k
nmap wl <C-w>l

"Toggle Menu and Toolbar
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


" == Plugins settings ==

" NERDTree 
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Grep 
nnoremap <silent> <F2> :Grep<CR>

" ConqueTerm
nnoremap <silent> <C-F7> :ConqueTerm zsh <CR>

" FuzzyFinder
nmap ff <ESC>:FufFile<CR>
nmap fb <ESC>:FufBuffer<CR>

" Tagbar 
let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
nmap <silent> <F7> :TagbarToggle<CR>

" Snippets
let g:snippetsEmu_key = "<C-s>"

" A
map <leader>a <ESC>:A<CR>

"Super Tab
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabCompletionContexts = ['s:ContextText']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" == Plugins settings done ==

" ctags and cscope and make
set cscopequickfix=s-,c-,d-,i-,t-,e-
map <leader>cs <ESC>:!cscope -Rbq<CR>
map <leader>ct <ESC>:!ctag -R .<CR>
autocmd FileType python map <F5> <ESC>:!python %:p<CR>
autocmd FileType go map <F5> <ESC>:!go install 
autocmd FileType javascript map <F5> <ESC>:!js %:p<CR>
autocmd FileType html map <F5> <ESC>:!google-chrome %:p<CR>
autocmd FileType c map <F5> <ESC>:make<CR>
autocmd FileType cpp map <F5> <ESC>:make<CR>
autocmd FileType coffee map <F5> <ESC>:CoffeeMake<CR>
autocmd FileType less map <F5> <ESC>:!lessc %:p > %<.css <CR>

autocmd FileType coffee map <F6> <ESC>:CoffeeCompile vertical<CR>

" Quick Fix
function! ToggleQF() 
    if !exists("g:fx_toggle") 
        let g:fx_toggle = 0 
    endif 
    if g:fx_toggle == 0 
        let g:fx_toggle = 1 
        copen 
    else 
        let g:fx_toggle = 0 
        cclose 
    endif 
endfunc 
map <F4> <ESC>:call ToggleQF() <CR>

" Status line
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASC:\%03.3b]\ [%p%%]\ [LEN=%L] 
set laststatus=2 

" Tab control
noremap <C-t> <ESC>:tabnew<CR>
noremap tt <ESC>:tabnew<CR>
noremap tc <ESC>:tabclose<CR>
noremap tn <ESC>:tabnext<CR>
noremap tp <ESC>:tabp<CR>

" omno complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt+=longest
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" remove trailing whitespace
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

" Platform dependent settings
if (has("gui_running"))
    " GUI
    set guioptions=T
    set guioptions-=b
    set guifont=Monaco\ 10
    set lazyredraw
    colo vividchalk
else
    colo xterm16
endif

" for Windows
if has("win32")
    set guifont=Courier_New:h10:cANSI
    set guifont=Consolas:h10:cANSI
    set guifont=Monaco:h12:cANSI
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

