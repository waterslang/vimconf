"
" -------------------------------
" vundle config begin
" -------------------------------
filetype off
set rtp+=$VIM_CONF_PATH/bundle/vundle

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" original repos
Plugin 'scrooloose/syntastic'
Plugin 'luochen1990/rainbow'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Townk/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Bundle 'Yggdroot/LeaderF'
Bundle 'tomasr/molokai'
Bundle 'taglist.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

