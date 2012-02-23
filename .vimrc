" Key binding
" <F1>: <ESC>
" <F2>: Grep
" <F3>: Toggle NERDTree
" <F4>: Toggle Quickview
" <F5>: Toggle Tlist
" <C-F5>: make/run
" <F6>: Shell
" <F7>: Fold/Un-Fold
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

syntax on
call pathogen#runtime_append_all_bundles()
filetype plugin on

" tab stop & shift width
set shiftwidth=4
set tabstop=4
set softtabstop=4
" expand tab & smarttab
set et
set smarttab
" tab settings for different file types
autocmd FileType javascript setlocal et sta sw=4 ts=4 sts=4
autocmd FileType python setlocal et sta sw=4 ts=4 sts=4
autocmd FileType html setlocal et sta sw=2 ts=2 sts=2
autocmd FileType css setlocal et sta sw=2 ts=2 sts=2
autocmd FileType go setlocal et sta sw=4 ts=4 sts=4

" code fold
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
map <F7> za

" show line number
set number
" display TAB character as <+++
set list
set list listchars=tab:<+

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
nnoremap <silent> <F6> :ConqueTerm zsh <CR>

" Tlist
let Tlist_Use_Left_Window=1
let Tlist_File_Fold_Auto_Close=1
" use F5 to Switch on/off TagList
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
"let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 30
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
nnoremap <silent> <F5> :Tlist<CR>

" Snippets
let g:snippetsEmu_key = "<C-s>"

" Zen coding 
let g:user_zen_settings = {'indentation' : '  '}

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
autocmd FileType python map <C-F5> <ESC>:!python %:p<CR>
autocmd FileType javascript map <C-F5> <ESC>:!js %:p<CR>
autocmd FileType html map <C-F5> <ESC>:!google-chrome %:p<CR>
autocmd FileType c map <C-F5> <ESC>:make<CR>
autocmd FileType cpp map <C-F5> <ESC>:make<CR>

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
noremap tn <ESC>:tabN<CR>
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
    set guifont=Monaco:h10:cANSI
    set guifont=Consolas:h10:cANSI
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

