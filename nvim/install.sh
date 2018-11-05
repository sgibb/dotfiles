#!/bin/bash
sudo apt-get install nvim
git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
nvim +PackagerInstall
