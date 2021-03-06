# Neovim Configuration

## Neovim Installation

Remove neovim if you have it in your system

```sh
sudo apt remove --purge neovim
sudo apt autoremove
```

Download the latest `nvim.appimage` from https://github.com/neovim/neovim/releases

Move the file and flag it as runnable

```sh
sudo mv nvim.appimage /usr/local/bin
sudo chmod +x /usr/local/bin/nvim.appimage
```

Set the command `vi`, `vim` and `nvim` to run neovim

```sh
export NVIM_PATH=/usr/local/bin/nvim.appimage

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

## Run

```sh
nvim
```

When inside nvim execute 
```sh
:PlugInstall
```

## Additional Dependencies

Install ripgrep for live grep in Telescope
```sh
sudo apt install ripgrep
```

Install nodejs for coc.nvim 

```sh
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Install coc.nvim clangs plugin
```sh
:CocInstall coc-clangd
:CocCommand clangd.install
```

Configure copilot plugin
```sh
:Copilot setup
```
