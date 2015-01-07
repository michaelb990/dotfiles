
# alias commands to switch between chef server

alias chef_switch_to_sea="ln -sf $HOME/Developer/Socrata/chef_repo/.chef $HOME/.chef"
alias chef_switch_to_azure="ln -sf $HOME/Developer/Socrata/azure_chef_repo/.chef $HOME/.chef"

# find out which chef server is default
alias wtf_chef="readlink $HOME/.chef"

