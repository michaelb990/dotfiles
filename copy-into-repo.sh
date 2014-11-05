for f in .vimrc .bashrc
do
  echo copying $f
  cp ~/$f ~/dotfiles/
done
