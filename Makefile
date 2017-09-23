default:
	# do some stuff
	#

install_pkgs:
	sudo apt-get -y $(cat pkgs.txt)


setup_git: 

	if [ ! -d "~/git" ]; then
		mkdir ~/git
	fi

	# badwolf
	git clone https://github.com/sjl/badwolf.git ~/git/badwolf
	# dotfiles
	git clone https://github.com/iced-tux/dotfiles.git ~/git/dotfiles
	# powerline-fonts
	git clone https://github.com/powerline/fonts.git ~/git/powerline-fonts
	# powerline-shell
	git clone https://github.com/milkbikis/powerline-shell ~/git/powerline-shell
	# .tmux
	git clone https://github.com/gpakosz/.tmux.git ~/git/tmux
	git clone https://github.com/zsh-users/antigen.git ~/git/antigen
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

setup_vim:

	cd $HOME/git/dotfiles
	stow vim --target ~/

setup_vim_vundle: 

