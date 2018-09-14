" -------------------------------
"" basic config of vim
" -------------------------------

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to, 使得v模式下h可以回退掉换行
set whichwrap+=<,>,h,l

"显示行号
set number

"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

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

set incsearch
set hlsearch


"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
"set ignorecase

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

"设置C/C++方式自动对齐
set autoindent
set cindent
set smarttab


""设置编码方式
"set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,euc-jp,euc-kr,latin1

" 命令行提示菜单， 按e 时能在buff提示文件
set wildmenu

" 命令行高度
set cmdheight=2

"设置换行符为unix
set ff=unix

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
"filetype indent on
"允许插件
filetype plugin on
"启动智能补全
"filetype plugin indent on

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo'
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"""""""""""""" vundle """""""""""""""
so $VIM_CONF_PATH/vundle_cfg.vim

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ Line:\ %l/%L:%c

""""""""""""""""""""""""""""""
" Minibuffer
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
" To enable the optional mapping of Control + Arrow Keys to window movement
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplSplitBelow = 1
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

function! CurWordCtrlSF() range
  let l:saved_reg = @"
  execute "normal! bye"
  let l:pattern = escape(@", '\\/.*$^~[]')
  " 无效
  "execute "normal <Plug>CtrlSFPrompt " . l:pattern 
  " 会显示搜索空
  "execute ":CtrlSF " . l:pattern . "^M"
  execute ":CtrlSF " . l:pattern 
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

nmap <leader>f :call CurWordCtrlSF()<CR>

"nmap <leader>f :!find 
"nmap <C-F> <Plug>CtrlSFPrompt
nmap <C-F> <Plug>CtrlSFPrompt holyshit
nmap <C-F>f :!find 

"Fast reloading of the .vimrc
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
"map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>


" quick tab
nmap <leader><Tab> :bn<cr>
nmap <leader>k :bp<cr>
so $VIM_CONF_PATH/q_nmap.vim

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
" use --exclude multi times ! 
map <leader>tt :cd ..<CR>:!ctags --exclude=libs --exclude=others -R ./<CR> :set tags=../tags<CR>
map <leader>ttt :!ctags --exclude=Lib --exclude=libs --exclude=others -R ./<CR> :set tags=tags<CR>

"""""""""""""""""" color """""""""""""""""""""
se background=dark
colorscheme molokai


