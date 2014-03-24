#!/bin/bash
apt-get update

# Vim & Curl:
apt-get install -y vim curl

# For NFS speedup:
apt-get install -y nfs-common portmap

# Configure Go & Vim:
# http://tip.golang.org/misc/vim/readme.txt?m=text
su vagrant -c "echo 'GOROOT=/usr/local/go' >> ~/.profile"
su vagrant -c "echo 'filetype off' > ~/.vimrc"
su vagrant -c "echo 'filetype plugin indent off' >> ~/.vimrc"
su vagrant -c "echo 'set runtimepath+=$GOROOT/misc/vim' >> ~/.vimrc"
su vagrant -c "echo 'filetype plugin indent on' >> ~/.vimrc"
su vagrant -c "echo 'syntax on' >> ~/.vimrc"
su vagrant -c "echo 'autocmd FileType go autocmd BufWritePre <buffer> Fmt' >> ~/.vimrc"
su vagrant -c "echo 'filetype plugin on' >> ~/.vimrc"
su vagrant -c "echo 'filetype indent on' >> ~/.vimrc"
su vagrant -c "echo 'autocmd FileType go compiler go' >> ~/.vimrc"
su vagrant -c "echo 'set number' >> ~/.vimrc"
# Install Vim plugins:
su vagrant -c "mkdir -p /home/vagrant/.vim/ftdetect"
su vagrant -c "mkdir -p /home/vagrant/.vim/syntax"
su vagrant -c "mkdir -p /home/vagrant/.vim/autoload/go"
su vagrant -c "mkdir -p /home/vagrant/.vim/ftplugin"
su vagrant -c "mkdir -p /home/vagrant/.vim/ftplugin/go"
su vagrant -c "mkdir -p /home/vagrant/.vim/indent"
su vagrant -c "mkdir -p /home/vagrant/.vim/compiler"
su vagrant -c "mkdir -p /home/vagrant/.vim/plugin"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftdetect/gofiletype.vim /home/vagrant/.vim/ftdetect/"
su vagrant -c "ln -s /usr/local/go/misc/vim/syntax/go.vim /home/vagrant/.vim/syntax"
su vagrant -c "ln -s /usr/local/go/misc/vim/autoload/go/complete.vim /home/vagrant/.vim/autoload/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go.vim /home/vagrant/.vim/ftplugin"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go/fmt.vim /home/vagrant/.vim/ftplugin/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go/import.vim /home/vagrant/.vim/ftplugin/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/indent/go.vim /home/vagrant/.vim/indent"
su vagrant -c "ln -s /usr/local/go/misc/vim/compiler/go.vim /home/vagrant/.vim/compiler"
su vagrant -c "ln -s /usr/local/go/misc/vim/plugin/godoc.vim /home/vagrant/.vim/plugin"