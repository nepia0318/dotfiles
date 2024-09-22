# dotfiles

## Ubuntu (WSL)

``` Shell
# Just in case
sudo apt update
sudo apt upgrade

# install & switch to zsh
sudo apt install -y zsh
sudo chsh $USER -s $(which zsh)

# Install git to clone this repository
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt install git

# Install packages and create symbliclink
source dotfiles/ubuntu-wsl/init.sh

# Setting zsh settings manually
source ~/.zshrc
```
