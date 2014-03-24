# golang-vagrant

Ubuntu 12.04-64 with Go installed as well as Vim and all the Go plugins for Vim

## What

* Base Ubuntu Precise 12.04 64-bit VM
* Golang 64-bit distribution (installed via Chef)
* Git latest stable
* Vim
* Vim/Golang [Plugins](http://tip.golang.org/misc/vim/readme.txt)
* Additional [Vim plugins](http://0value.com/my-Go-centric-Vim-setup) __COMING SOON__
* Copies over your Git config (~/.gitconfig) for turnkey git access

## Usage

### Install Vagrant 1.5:
[http://vagrantup.com](http://vagrantup.com)

### Install VirtualBox:
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Install this box:

```
git clone git@github.com:cbumgard/golang-vagrant.git
cd golang-vagrant
sudo ./install_vagrant_sudoers.sh
vagrant up
vagrant ssh
```

Note the 3rd step above is optional. Here's more:

### Optional:

```sudo ./install_vagrant_sudoers.sh```

This prevents Vagrant asking you to auth as sudo on ```vagrant up``` for fast NFS file sync.

This box synchronizes your home ```~``` directory on your host to to ```/host/``` on the guest VM so you can use your local code in the VM. It uses NFS to make the file sync much faster than default, and this requires you to enter your password when starting/stopping the machine. You can disable if you want by changing the Vagrantfile from:

```config.vm.synced_folder "~/", "/host", nfs: true```

to:

```config.vm.synced_folder "~/", "/host"```

### For Git:

You'll need to generate an SSH key in the VM and add it to your GitHub account before you can push from within the VM. So inside the Vagrant VM follow these [instructions](https://help.github.com/articles/generating-ssh-keys).

Then copy the contents of ```~/.ssh/id_rsa.pub``` into [https://github.com/settings/ssh](https://github.com/settings/ssh)