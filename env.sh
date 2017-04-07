#! /bin/bash
# this is set for env which used by
# use source to export VIM_CONF_PATH to work shell

if test "${VIM_CONF_PATH:-}" != ""; then :
	echo "env.sh >> VIM_CONF_PATH=$VIM_CONF_PATH  has been set "
	# can not use exit here when use source！ terminal shell will be close
fi

if [ -z "${VIM_CONF_PATH:-}" ]; then :

export VIM_CONF_PATH=`pwd`
echo "append VIM_CONF_PATH=$VIM_CONF_PATH to ~/.bashrc "
# when use cat << , can not use tab indent of _EOF
cat <<_EOF >> ~/.bashrc
export VIM_CONF_PATH=$VIM_CONF_PATH
_EOF

fi

if [ -f ./config.sh ] ; then
	chmod +x ./config.sh
fi
