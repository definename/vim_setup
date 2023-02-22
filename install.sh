#! /bin/bash

PATCH_AUTOLOAD_DIR=~/.vim/pack/plugins/start
rm -rf $PATCH_AUTOLOAD_DIR
mkdir -pv $PATCH_AUTOLOAD_DIR

NERDTREE_SRC=https://github.com/preservim/nerdtree.git
NERDTREE_DST_DIR=$PATCH_AUTOLOAD_DIR/nerdtree
git clone $NERDTREE_SRC $NERDTREE_DST_DIR
ecode=$?
if [ $ecode -ne 0 ]; then
	echo Failed to clone:$NERDTREE_SRC code:$ecode
	exit $ecode
fi

CTRLP_SRC=https://github.com/ctrlpvim/ctrlp.vim.git
CTRLP_DST_DIR=$PATCH_AUTOLOAD_DIR/ctrlp
git clone $CTRLP_SRC $CTRLP_DST_DIR
ecode=$?
if [ $ecode -ne 0 ]; then
	echo Failed to clone:$CTRLP_SRC code:$ecode
	exit $ecode
fi

VIMRC_FILENAME=.vimrc
cp -v ./$VIMRC_FILENAME ~/$VIMRC_FILENAME
ecode=$?
if [ $ecode -ne 0 ]; then
	echo Failed to copy:$VIMRC_FILENAME code:$ecode
	exit $ecode
fi

echo Done!
exit 0
