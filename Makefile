default:
	# do some stuff
	#

install_pkgs:
	sudo apt-get -y $(cat pkgs.txt)

setup_vim_vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

setup_vim:
