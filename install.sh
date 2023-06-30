#! /bin/bash

#
# If help does not work for plugins:
#  helptags ~/.vim/pack/plugins/start/nerdtree/doc
#  helptags ~/.vim/pack/plugins/start/ctrlp.vim/doc
#  helptags ~/.vim/pack/plugins/start/taglist.vim/doc
#
# ctags should be installed to be able to use taglist plugin
#  Install it with apt: sudo apt install exuberant-ctags
#  Build and install it manually from sources: https://ctags.sourceforge.net/

MODE=$1

PACKAGE_AUTOLOAD_DIR=~/.vim/pack/plugins/start

NERDTREE_DST_DIR=$PACKAGE_AUTOLOAD_DIR/nerdtree
CTRLP_DST_DIR=$PACKAGE_AUTOLOAD_DIR/ctrlp
TAGLIST_DST_DIR=$PACKAGE_AUTOLOAD_DIR/taglist

do_cleanup() {
	rm -rf $PACKAGE_AUTOLOAD_DIR
	mkdir -pv $PACKAGE_AUTOLOAD_DIR
}

do_copyvimrc() {
	VIMRC_FILENAME=.vimrc
	cp -v ./$VIMRC_FILENAME ~/$VIMRC_FILENAME
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to copy:$VIMRC_FILENAME code:$ecode
		exit $ecode
	fi
}

if [ "$MODE" == "local" ]; then
	do_cleanup

	NERDTREE_SRC=./nerdtree.tar.gz
	tar -xzvf $NERDTREE_SRC -C $PACKAGE_AUTOLOAD_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to untar:$NERDTREE_SRC code:$ecode
		exit $ecode
	fi

	CTRLP_SRC=./ctrlp.vim.tar.gz
	tar -xzvf $CTRLP_SRC -C $PACKAGE_AUTOLOAD_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to untar:$CTRLP_SRC code:$ecode
		exit $ecode
	fi

	TAGLIST_SRC=./taglist.vim.tar.gz
	tar -xzvf $TAGLIST_SRC -C $PACKAGE_AUTOLOAD_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to untar:$TAGLIST_SRC code:$ecode
		exit $ecode
	fi

	do_copyvimrc

	echo $MODE install done!
	exit 0
elif [ "$MODE" == "remote" ]; then
	do_cleanup
	NERDTREE_SRC=https://github.com/preservim/nerdtree.git
	git clone $NERDTREE_SRC $NERDTREE_DST_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to clone:$NERDTREE_SRC code:$ecode
		exit $ecode
	fi

	CTRLP_SRC=https://github.com/ctrlpvim/ctrlp.vim.git
	git clone $CTRLP_SRC $CTRLP_DST_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to clone:$CTRLP_SRC code:$ecode
		exit $ecode
	fi

	TAGLIST_SRC=https://github.com/vim-scripts/taglist.vim.git
	git clone $TAGLIST_SRC $TAGLIST_DST_DIR
	ecode=$?
	if [ $ecode -ne 0 ]; then
		echo Failed to clone:$TAGLIST_SRC Ccode:$ecode
		exit $ecode
	fi

	do_copyvimrc

	echo $MODE install done!
	exit 0
else
	echo "Incorrect mode, $0 [local|remote]"
	exit 1
fi
