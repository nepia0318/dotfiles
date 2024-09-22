# dotfiles

## Ubuntu (WSL)

``` Shell
# Just in case
sudo apt update
sudo apt upgrade

# install & switch to zsh
sudo apt-get install -y zsh
sudo chsh "${USER}" -s "$(which zsh)"

# Install git to clone this repository
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt install git
```
