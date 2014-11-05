for f in .vimrc .bashrc
do
  echo placing $f
  cp ~/dotfiles/$f ~/
done
