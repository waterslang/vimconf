" -------------------------------
"" basic config of vim
" -------------------------------

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number

"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=500

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
"set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"禁止将Tab键自动转换成空格  如果开启, 真正需要Tab键时使用[Ctrl + V + Tab]
set noexpandtab
"
""设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,euc-jp,euc-kr,latin1

"设置换行符为unix
set ff=unix

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

" -------------------------------
" vundle config begin
" -------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" original repos

Bundle 'taglist.vim'
Bundle 'fholgado/minibufexpl.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"Format the statusline
set statusline=\ %F%m%r%h\ %w\ Line:\ %l/%L:%c

""""""""""""""""""""""""""""""
" Minibuffer
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
" To enable the optional mapping of Control + Arrow Keys to window movement
let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplSplitBelow = 1
autocmd BufRead,BufNew :call UMiniBufExplorer

"Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

""""""""""""""""""""""""
"leader mappings"
""""""""""""""""""""""""

"Set mapleader
let mapleader = ","
let g:mapleader = ","

nmap <leader>f :!find 

"Fast reloading of the .vimrc
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
"map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>


" quick tab
nmap <leader><Tab> :bn<cr>
nmap <leader>k :bp<cr>
nmap <leader>,, :b 1<cr>
nmap <leader>,2 :b 2<cr>
nmap <leader>3 :b 3<cr>
nmap <leader>4 :b 4<cr>
nmap <leader>5 :b 5<cr>
nmap <leader>6 :b 6<cr>
nmap <leader>7 :b 7<cr>
nmap <leader>8 :b 8<cr>
nmap <leader>9 :b 9<cr>
nmap <leader>10 :b 10<cr>
nmap <leader>11 :b 11<cr>
nmap <leader>12 :b 12<cr>
nmap <leader>13 :b 13<cr>
nmap <leader>14 :b 14<cr>
nmap <leader>15 :b 15<cr>
nmap <leader>16 :b 16<cr>
nmap <leader>17 :b 17<cr>
nmap <leader>18 :b 18<cr>
nmap <leader>19 :b 19<cr>
nmap <leader>20 :b 20<cr>
nmap <leader>21 :b 21<cr>
nmap <leader>22 :b 22<cr>
nmap <leader>23 :b 23<cr>
nmap <leader>24 :b 24<cr>
nmap <leader>25 :b 25<cr>
nmap <leader>26 :b 26<cr>
nmap <leader>27 :b 27<cr>
nmap <leader>28 :b 28<cr>
nmap <leader>29 :b 29<cr>

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann: 实现选定区域的search
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""FileType settings"""""""""""""""
autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
autocmd FileType lua map <buffer> <leader><space> :w!<cr>:!lua %<cr>

au FileType java inoremap <buffer> <C-p> System.out.println();<esc>hi

   """"""""""""""""""""""""""""""
   " C mappings
   """""""""""""""""""""""""""""""
   autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc -g %<cr>
   autocmd FileType cpp map <buffer> <leader><space> :w<cr>:!g++ -g %<cr>



"invalid the 'K' action
au FileType python,lua nnoremap <leader>k K <Nop>
au FileType python,lua nnoremap <leader>j J <Nop>

au FileType python,lua nnoremap <buffer> K <Nop>
au FileType python,lua vnoremap <buffer> K <Nop>
au FileType python,lua nnoremap <buffer> J <Nop>
au FileType python,lua vnoremap <buffer> J <Nop>


" Ctags
set tags=../tags

" Reset tags
map <F12> :!gtags<CR> :cs reset<CR> :!/usr/local/bin/exctags -R<CR> :set tags=tags<CR>
map <leader>tt :cd ..<CR>:!ctags -R ./<CR> :set tags=../tags<CR>
map <leader>ttt :!ctags -R ./<CR> :set tags=tags<CR>




