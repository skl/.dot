all: neobundle

neobundle: symlinks
	git clone https://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim
	cd vim/bundle/neobundle.vim; git checkout master; ./bin/neoinstall

symlinks:
	ln -si ${HOME}/.dot/vim ${HOME}/.vim
	ln -si ${HOME}/.dot/vim/rc ${HOME}/.vimrc

.PHONY: all neobundle symlinks
