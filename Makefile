default:
	# do some stuff
	#

install_pkgs:
	sudo apt-get -y $(cat pkgs.txt)


setup_git: install_pkgs

	if [ ! -d "~/git" ]; then
		mkdir ~/git
	fi

	# badwolf
	git clone https://github.com/sjl/badwolf.git ~/git/
	# dotfiles
	git clone https://github.com/iced-tux/dotfiles.git ~/git/
	# powerline-fonts
	git clone https://github.com/powerline/fonts.git ~/git/
	# powerline-shell
	git clone https://github.com/milkbikis/powerline-shell ~/git/
	# .tmux
	git clone https://github.com/gpakosz/.tmux.git ~/git/
	
	## install global gitignore
	cd $HOME/git/dotfiles
	stow git --target ~/

setup_vim: setup_git

	cd $HOME/git/dotfiles
	stow vim --target ~/

setup_vim_vundle: setup_vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

