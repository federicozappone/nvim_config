# Neovim Configuration

## Neovim Installation

Remove neovim if you have it in your system

```sh
sudo apt remove --purge neovim
sudo apt autoremove
```

Install build prerequisites

```sh
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

Install ripgrep for live grep in Telescope

```sh
sudo apt install ripgrep
```

Install nodejs 16.x for mason

```sh
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Build neovim stable from source

```sh
git clone https://github.com/neovim/neovim.git
cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Set the command `vi`, `vim` and `nvim` to run neovim

```sh
export NVIM_PATH=/usr/local/bin/nvim

sudo update-alternatives --install /usr/bin/nvim nvim "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${NVIM_PATH}" 110
```

## Fonts

Install the icons fonts

```sh
sudo cp fonts/* /usr/local/share/fonts
sudo fc-cache -fv
```

## Running

```sh
vi
```

When inside nvim execute 
```sh
:PlugInstall
```

Install clangd LSP
```sh
:LspInstall clangd
```
