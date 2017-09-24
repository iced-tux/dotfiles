setup_env: setup_base install_pkgs setup_base setup_git setup_vim setup_zsh setup_lxterminal


setup_base:

	sudo apt-get install -y git git-man git-doc gitk

	mkdir ~/git

	# dotfiles
	git clone https://github.com/iced-tux/dotfiles.git ~/git/dotfiles

install_pkgs:

	sudo apt-get -y $(cat ~/git/dotfiles/pkgs.txt)

setup_git: 

	# powerline-fonts
	git clone https://github.com/powerline/fonts.git ~/git/powerline-fonts
	# powerline-shell
	git clone https://github.com/milkbikis/powerline-shell ~/git/powerline-shell
	# .tmux
	git clone https://github.com/gpakosz/.tmux.git ~/git/tmux
	# antigen
	git clone https://github.com/zsh-users/antigen.git ~/git/antigen
	# Vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

setup_vim:

	cd $HOME/git/dotfiles
	stow vim --target ~/

	vim +PluginInstall +qall

setup_zsh:

	cd $HOME/git/dotfiles
	stow zhrc --target ~/

	# setup powershell
	~/git/powerline-shell/setup.py build
	sudo ~/git/powerline-shell/setup.py build
	cd $HOME/git/dotfiles
	stow powerline-shell --target ~/

	chsh -s /bin/zsh

setup_lxterminal:

	~/git/powerline-fonts/install.sh
	cd $HOME/git/dotfiles
	stow lxterminal --target ~/

setup_i3:

	curl -L http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb -o /tmp/keyring.deb
	sudo dpkg --install /tmp/keyring.deb
	sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
	sudo apt-get update && sudo apt-get install -y i3 i3blocks i3lock i3status i3-wm 
