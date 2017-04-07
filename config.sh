#! /bin/bash

# use source ./env.sh to set VIM_CONF_PATH

if [ -z "${VIM_CONF_PATH:-}" ]; then :
	VIM_CONF_PATH=`pwd`
	echo "config.sh >> set VIM_CONF_PATH with pwd, VIM_CONF_PATH=%VIM_CONF_PATH"
fi
[ -f ~/.vimrc ] && echo "config.sh >> ~/.vimrc existed; bak to ~/.vimrc_bak "; mv ~/.vimrc ~/.vimrc_bak
# set .vimrc 
echo "config.sh >> link vimrc to ~/.vimrc ..."
ln -s "$VIM_CONF_PATH/vimrc" ~/.vimrc

echo "config.sh git submoule update --init    to clone vundle ..  "
git submodule update --init
echo "config.sh >> install all plugins of vundle_cfg.vim ..."
vim +PluginInstall +all

echo "config.sh >> config ok"
