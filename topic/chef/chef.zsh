
# alias commands to switch between chef server

alias chef-switch-to-sea="ln -sf $HOME/Developer/Socrata/chef-repo/.chef $HOME/.chef"
alias chef-switch-to-azure="ln -sf $HOME/Developer/Socrata/azure-chef-repo/.chef $HOME/.chef"

# find out which chef server is default
alias wtf-chef="readlink $HOME/.chef"

