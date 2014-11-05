for f in .vimrc .bash_profile
do
  echo copying $f
  cp ~/$f ~/dotfiles/
done
