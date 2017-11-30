Dotfiles
=======
a collection of dotfiles that I have found useful.

### How this works
* cd into the dotfiles repo
* `rake install` will trigger an install
* the install task will link any files found in topic/\*\*/\*.symlink to dotfiles in the home directory
    - ex: my zshrc file is stored in topic/zsh/zshrc.symlink. the script will create a link in my home directory ~/.zshrc => ~/dotfiles/topic/zsh/zshrc.symlink

### Topics
* i'm using topics to break up configuration files by topic. zsh-related files go into topic/zsh/ while vim-related ones go to topic/vim/
* topic directories typically have a few common files
    - \*.symlink: a dotfile to link to from the $HOME directory
    - \*.zsh: a script file that will be executed by the zshrc startup script
    - install.sh: a shell to install packages and dependencies related to the topic

### Good examples to keep an eye on
* cdzombak/dotfiles
* holman/dotfiles
* ryanb/dotfiles
* http://justinlilly.com/dotfiles/zsh.html
* howardabrams/dot-files, esp for the [emacs config](https://github.com/howardabrams/dot-files/blob/master/emacs.org)
* ... will add more as I find them.
