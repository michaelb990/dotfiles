dotfiles
=================

## setup

### homebrew

Install:
* https://docs.brew.sh/Installation

```
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
```

### zsh / terminal

Install:
* iterm
* https://ohmyz.sh/
* https://github.com/romkatv/powerlevel10k#homebrew
* https://github.com/altercation/solarized

```
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install theme
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# download solarized
git clone https://github.com/altercation/solarized ~/setup/solarized
```

* import the solarized color schemes into iterm
* go to preferences > profile > keys > key mappings. select "Natural text editing" preset.

### emacs

Install:
* https://github.com/d12frosted/homebrew-emacs-plus#install
* https://prelude.emacsredux.com/en/latest/installation/

emacs:
```
brew tap d12frosted/emacs-plus
brew install emacs-plus
```

prelude:
```
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
```