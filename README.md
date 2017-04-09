# vimconf
config of vim .vim with vundle

install:
source evn.sh
./config.sh

notice:
	vim +PluginInstall +all	    will install plugin in .vim/bundle/, not git clone path


there is a question: colorscheme shows different in unbuntu, debian secureCrt terminal, and gvim, 
	  and i want to use different color scheme, then, i must copy vimrc, but not use $ln -s 

but when I use copy, it will not get the change automatically, and i must manually update change! 


use vundle has a problem: if i change a work machine, i need to 
	1 git clone https://github.com/waterslang/vimconf.git			(takes time)
	2 use PluginIntall :     take more time
	

but if keep a copy of colors and plugins of my own! 
i just need to write a bash install_and_update.sh to put it in the right position, which would be much easier


