filetype off
" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

" No ToolBar
set go=aeg

" 字符编码设置
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,prc,taiwan,latin-1
set termencoding=utf-8
set fileformats=dos,unix

" 解决consle输出乱码
"language messages zh_CN.utf-8

" 自动检测文件类型并加载相应的设置
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" 自动检测语法
syntax on

" Color Scheme
colorscheme desert "wombat
set background=dark

" 在tab上只显示文件名
set guitablabel=%t

" auto reload .vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

" no error bell
set noeb

" 设置字体
set gfn=Monaco\ 11
"set gfn=Inconsolata:h16
"set gfn=DroidSansMono\ 11 "Monaco\ 11
"set gfn=Monaco:h14

set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y
" In Ubuntu, install cups-pdf to support print out pdf file
" apt-get install cups-pdf

" 显示行号
set number

" 总是显示status bar
set laststatus=2

" cool补全
set wildmenu
set wildignore+=*.o,*~
set suffixes+=.in,.a

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set textwidth=80        " break lines when line length increases
set tabstop=2           " use 4 spaces to represent tab
set shiftwidth=2        " number of spaces to use for auto indent
set softtabstop=2
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

" 整词换行
set linebreak

" save and restor fold
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" ======================
" Compile and Run
" ======================
nmap ,car :call CompileAndRun()<cr>
nmap ,com :call Compile()<cr>
function! Compile()
	if expand("%:e") == "cpp"
		execute "w"
		execute "!g++ -o %:r %"
	elseif expand("%:e") == "java"
		execute "w"
		execute "!javac %:p"
	elseif expand("%:e") == "erl"
		execute "w"
		execute "!erlc %:p"
	endif
endfunction
function! CompileAndRun()
	if expand("%:e") == "cpp"
		exec "w"
		exec "!g++ -o %:r % && ./%:r"
	elseif expand("%:e") == "java"
		exec "w"
		exec "!javac %:p && java -cp %:p:h %:t:r"
    elseif expand("%:e") == "py"
		exec "w"
		exec "!python %:p"
	endif
endfunction

" ======================
" Tab move
" ======================
" go to prev tab 
nmap <S-H> gT
" go to next tab
nmap <S-L> gt

" ======================
" Windows move
" ======================
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-H> <C-w>h
nmap <C-L> <C-w>l

" =======================
" 窗口操作的快捷键
" =======================
nmap ,wv <C-w>v " 垂直分割当前窗口
nmap ,wc <C-w>c " 关闭当前窗口
nmap ,ws <C-w>s " 水平分割当前窗口

" =======================
" 模仿MS Windows中的保存命令: Ctrl+S
" =======================
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>

" =======================
" MiniBufferExplorer
" =======================
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow=0
let g:miniBufExplDebugLevel=0
"map <F3> :MBEbp<cr>
"map <F4> :MBEbn<cr>
"nmap <S-H> :MBEbp<cr>
"nmap <S-L> :MBEbn<cr>

" =======================
" NERD Tree
" =======================
let g:NERDTreeWinPos = "right"
let g:NERDChristmasTree = 1
let g:NEROTreeWinSize = 20
map <F5> :NERDTree<cr>
map <F6> :NERDTreeClose<cr>
let NERDTreeIgnore=['\.pyc$', '\~$']

" =======================
" TagList Tree
" =======================
"let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'
"let Tlist_Auto_Open = 0 
"let Tlist_Exit_OnlyWindow = 1 
"map <F7> :TlistToggle<cr>

nmap <F7> :TagbarToggle<CR> 

" =======================
" Template plugin
" =======================
let g:template_load = 1
let g:template_tags_replacing = 1
let g:T_AUTHOR = "Wenbin Wu"
let g:T_AUTHOR_EMAIL = "wwu@mozilla.com"
let g:T_AUTHOR_WEBSITE = "http://www.wenbinwu.com"
let g:T_DATE_FORMAT = "%c"

" =======================
" SnipMate
" =======================
let g:snips_author = "Wenbin Wu  wwu@mozilla.com"

" =======================
" Configure for PYTHON
" =======================
if has("autocmd")

  " Python 文件的一般设置，比如不要 tab 等
  " autocmd FileType python setl et | setl sta | setl sw=4 | setl ts=4 | setl sts=4

  " Python Unittest 的一些设置
  " 可以让我们在编写 Python 代码及 unittest 测试时不需要离开 vim
  " 键入 :make 或者点击 gvim 工具条上的 make 按钮就自动执行测试用例
  "autocmd FileType python setlocal makeprg=python\ ./alltests.py
  "autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %

  " 自动使用新文件模板
  "autocmd BufNewFile test*.py 0r ~/.vim/skeleton/test.py
  "autocmd BufNewFile alltests.py 0r ~/.vim/skeleton/alltests.py
  "autocmd BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py
endif

" =======================
" Special
" =======================
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" =======================
" Python
" =======================
au BufEnter,BufNewFile *.py set expandtab
autocmd FileType python setl et | setl sta | setl sw=4 | setl ts=4 | setl sts=4

" =======================
" 纯文本文件
" =======================
au BufRead,BufNewFile *.txt setl ft=txt
map <F8> :Tlist<CR>
       
" =======================
" CoffeeScript
au BufRead,BufNewFile *.coffee set expandtab 
autocmd BufEnter,BufReadPre *.coffee setl ts=2 | setl sts=2 |setl sw=2
map \co :CoffeeCompile watch vert<CR>:setl scrollbind<CR><C-W>20>
map \cj :!coffee -cb %:p<CR>

" ======================
" jade
autocmd BufEnter,BufReadPre *.jade set expandtab
autocmd BufEnter,BufReadPre *.jade setl ts=2 | setl softtabstop=2 |setl shiftwidth=2
map \cd :!jade %:p<CR>

" ======================
" JS
autocmd BufEnter,BufReadPre *.js setl ts=2 | setl sts=2 |setl sw=2 | setl expandtab

" ======================
" HTML
autocmd BufEnter,BufReadPre *.html setl ts=2 | setl sts=2 |setl sw=2
autocmd BufEnter,BufReadPre *.tex set tw=0

" ======================
" ctrlp
" ======================
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX

" ======================
" ACK
" ======================
" Ubuntu only
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" ======================
" Modeline
" ======================
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

set fillchars+=stl:\ ,stlnc:\

let $JS_CMD='node'

syn region javaScriptFunctionFold  start="{" end="}" transparent fold

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
