#! bin/bash
mypath=`pwd`
[ -f ~/.vimrc ] && echo "exist .vimrc bak to .vimrc_bak "; mv ~/.vimrc ~/.vimrc_bak
# set .vimrc 
echo "link vimrc to ~/.vimrc ..."
ln -s "$mypath/vimrc" ~/.vimrc
echo "config ok"
