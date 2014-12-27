source ~/dotfiles/antigen/antigen.zsh

# Source config details from all *.zsh files in the config directory
for file ($HOME/dotfiles/config/*.zsh) source $file

# Source local details from a .localrc file outside of the dotfiles project
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES

git
command-not-found
rbenv
bundler
brew
gem

EOBUNDLES

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

