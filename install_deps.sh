#! /bin/bash

sudo apt install python3 python3-pip curl
pip3 install pynvim neovim jedi-language-server

curl -OL https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz

sudo chown -R $USER:$USER /usr/local
cp nvim-linux64/bin/nvim /usr/local/bin
cp -r nvim-linux64/share/* /usr/local/share/

cat << ~/.bashrc << EOF
export PYTHONSTARTUP="$(python -m jedi repl)"
EOF
