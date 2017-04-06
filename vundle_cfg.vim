"
" -------------------------------
" vundle config begin
" -------------------------------
filetype off
set rtp+=~/work/vimconf/bundle/vundle

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" original repos

Bundle 'taglist.vim'
Bundle 'fholgado/minibufexpl.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


