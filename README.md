# dotfiles

## for OS

### Ubuntu (WSL)

#### Set local environment valiables (Required, In advance)

Set `.zlocal`(any name) and load.

``` shell
mkdir -p ~/.zsh
touch ~/.zsh/.zlocal
vi ~/.zsh/.zlocal
source ~/.zsh/.zlocal
```

Variable list is below.

| Name | Description | example |
| ---- | ---- | ---- |
| `DFLINK_YAML` | Path to dflist.yml | "$path_to_repo/dotfiles/ubuntu-wsl/dflist.yml" |
| `DFLINK_DOTFILES_ROOT` | Path to dotfiles repository | "$path_to_repo/dotfiles/repo" |
| `VSCODE_PATH` | Path to VSCode | "/mnt/c/Users/${WIN_USER}/AppData/Local/Programs/Microsoft VS Code/bin" |

#### At least

Only use Ubuntu shell.

``` shell
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

# Install dflink for create symbliclink
git clone https://github.com/nepia0318/dflink.git
sudo ln -fnvs $path_to_repo/dflink/dflink /usr/local/bin/dflink

# Install packages and create symbliclink
git clone https://github.com/nepia0318/dotfiles.git
. $path_to_repo/dotfiles/ubuntu-wsl/init.sh

# Setting zsh settings manually
source ~/.zshrc
```

#### Remove $PATH derived from host windows

Addition to the above, restart WSL.

``` powershell
wsl -t Ubuntu-24.04 (or other version)
```

## Others

### neovim

Execute command manually on neovim.

``` lua
:JetpackSync
```
