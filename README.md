# dotfiles
Here you will find my dotfiles for my window managers, vim. neovim and many more feel free to download, use, edit and upload them as you want.

# alacritty
Install alacritty and create a directory .config/alacritty and copy the file alacritty.yml to this directory.

# nvim
To configure nvim you need following dependencies:
- nvim
- vim
- python
- pynvim
- npm
- node
- llvm
- ccls
- https://github.com/junegunn/vim-plug

And then simply create a directory .config/nvim and copy the file init.vim in this directory.

# awesome
Install awesome and create a directory .config/awesome and copy the files theme.lua and rc.lua to this directory.

# bspwm (with polybar)
## bspwm
1. Install bspwm and sxhkd and create the directories .config/bspwm and .config/sxhkd
2. copy bspwmrc to .config/bspwm
3. copy sxhkdrc tp .config/sxhkd
4. Make it runnable: chmod +x /home/(your user name here)/.config/bspwm/bspwmrc
5. Make it runnable: chmod +x /home/(your user name)/.config/sxhkd/sxhkdrc

And add
`sxhkd & 
exec bspwm`
to the .xinitrc file

## polybar
1. Install polybar
2. Install the awesome font package 
3. create a directory .config/polybar and copy the file config there
4. restart bspwm or run `polybar bar -r &` to get the debug logs

# zsh
1. Install zsh
2. Install https://github.com/zsh-users/zsh-syntax-highlighting 
3. run `zsh` to configure the shell
4. copy the content of .zshrc to your .zshrc file
5. Change your shell with `chsh` to `/bin/zsh` 

# zathura
1. Install mupdf and zathura-mupdf
