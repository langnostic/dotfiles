#!/usr/bin/env fish

#####  Remove fish greeting  #####
set fish_greeting ""

#####  Setup Common Paths  #####
set SOURCE_DIR $HOME/Source
set DOTFILES $SOURCE_DIR/dotfiles
set FISH_PATH $XDG_CONFIG_HOME/fish
set NVIM_PATH $XDG_CONFIG_HOME/nvim

#####  Aliases  #####
alias vim='nvim'
alias ll='ls -lah'

#####  Set Abbreviations  ######
# Docker
abbr --add d 'docker'
abbr --add dps 'docker ps'
abbr --add dc 'docker-compose'
abbr --add dcb 'docker-compose build'
abbr --add dcu 'docker-compose up'
abbr --add dcdr 'docker-compose down --remove-orphans'

# Edit Common Configs
abbr --add edit_fish 'vim $FISH_PATH/config.fish'
abbr --add edit_nvim 'vim $NVIM_PATH/init.vim'

# Updates and Upgrades
abbr --add dupgrade 'deno upgrade'
abbr --add fupdate 'flatpak update'
abbr --add rupdate 'rustup update'
abbr --add update 'sudo apt update && apt list --upgradable'
abbr --add upgrade 'sudo apt upgrade -y'

# Misc
abbr --add dotfiles 'cd $DOTFILES'
abbr --add install_vimplugs 'neovim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"'
abbr --add ppath 'echo $PATH'
abbr --add reset_fish 'source $FISH_PATH/config.fish'

# Git abbr's
abbr --add ga 'git add'
abbr --add gaa 'git add -A'
abbr --add gb 'git branch'
abbr --add gba 'git branch -a'
abbr --add gbl 'git branch -l'
abbr --add gbm 'git branch -M'
abbr --add gcam 'git commit -a -m'
abbr --add gcb 'git checkout -b'
abbr --add gcm 'git commit -m'
abbr --add gco 'git checkout'
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'
abbr --add gl 'git pull'
abbr --add gp 'git push'
abbr --add gpu 'git push -u origin'
abbr --add gpum 'git push -u origin main'
abbr --add gsl 'git status --long'
abbr --add gss 'git status -s'
abbr --add gst 'git status'

#####  Add Deno to Path  #####
if test -d $HOME/.local/deno
    set -x DENO_INSTALL $HOME/.local/deno
    fish_add_path $HOME/.local/deno/bin
else if test -d $HOME/.deno
    set -x DENO_INSTALL $HOME/.deno    
    fish_add_path $HOME/.deno/bin
end
    
#####  Add Cargo to Path  #####
if test -d $HOME/.cargo 
    fish_add_path $HOME/.cargo/bin
end

#####  macOS Specific thangs  #####
if test (uname) = "Darwin"
    alias updatedb="sudo /usr/libexec/locate.updatedb"
end

#####  Starship Prompt setup  #####
starship init fish | source
