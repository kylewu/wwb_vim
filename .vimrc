set go-=T

" =========vim setting
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,prc,taiwan,latin-1
set termencoding=utf-8
set fileformats=dos,unix
" 解决consle输出乱码
language messages zh_CN.utf-8

filetype plugin indent on               " conf file for different languages are located in .vim/ftplugin
syntax on
colorscheme wombat "desert 

" Only display file name on tab
set guitablabel=%t

" auto reload .vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

set noeb				" no error bell
"set paste				" enable paste
set nocompatible

set gfn=Monaco:h14  			" font
set number 			        	" Turn on line numbers
set showcmd                     " show (partial) command in status line
set ruler                       " show line and column number

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set linebreak 					" 整词换行
set wildmode=longest:full 		" Filename completion
set wildmenu 					" Filename Completion

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
" Windows move
" ======================
nmap ,wj <C-w>j
nmap ,wk <C-w>k
nmap ,wh <C-w>h
nmap ,wl <C-w>l

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
map <F2> :MBEbp<cr>
map <F3> :MBEbn<cr>
map <F12> :TMiniBufExplorer<cr>

" =======================
" NERD Tree
" =======================
let g:NERDTreeWinPos = "right"
let g:NERDChristmasTree = 1
let g:NEROTreeWinSize = 20
map <F5> :NERDTree<cr>
map <F6> :NERDTreeClose<cr>

" =======================
" TagList Tree
" =======================
let Tlist_Ctags_Cmd = '/opt/local/var/macports/software/ctags/5.8_0/opt/local/bin/ctags'
let Tlist_Auto_Open = 0 
let Tlist_Exit_OnlyWindow = 1 
map <F4> :TlistToggle<cr>

" =======================
" Template plugin
" =======================
let g:template_load = 1
let g:template_tags_replacing = 1
let g:T_AUTHOR = "Kyle Wu"
let g:T_AUTHOR_EMAIL = "imkylewu@gmail.com"
let g:T_AUTHOR_WEBSITE = "http://www.kylewu.net"
let g:T_DATE_FORMAT = "%c"
" =======================
" SnipMate
" =======================
let g:snips_author = "Kyle Wu  imkylewu@gmail.com"

" =======================
" FuzzyFinder
" =======================
let g:fuf_modesDisable=[]
let g:fuf_previewHeight=0
nmap ,fb :FufBuffer<CR>
nmap ,ff :FufFile<CR>
nmap ,fd :FufDir<CR>
nmap ,fmf :FufMruFile<CR>
nmap ,fmc :FufMruCmd<CR>
nmap ,ft :FufTag<CR>
nmap ,ftf :FufTaggedFile<CR>
nmap ,fjl :FufJumpList<CR>
nmap ,fcl :FufChangeList<CR>
nmap ,fq :FufQuickfix<CR>
nmap ,fl :FufLine<CR>
nmap ,fh :FufHelp<CR>

" =======================
" Configure for PYTHON  
" =======================
" -----------------------
" pylint plugin
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
