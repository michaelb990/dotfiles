for f in .vimrc .bash_profile
do
  echo placing $f
  cp ~/dotfiles/$f ~/
done
