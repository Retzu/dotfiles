#!/bin/bash

PPAS=(
    "ppa:snwh/pulp" # Paper GTK theme
)
PACKAGES=(
    "vim"
    "vim-gtk"
    "zsh"
    "python3"
    "terminator"
    "git"
)
DEBS=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" # Chrome
)

# Add PPAs and update cache
for ppa in ${PPAS[@]}; do
    echo "Adding PPA ${ppa}"
    sudo add-apt-repository --yes ${ppa}
done
sudo apt-get update

# Install packages
sudo apt-get install --yes ${PACKAGES[@]}

# Download debs and install those
for deb in ${DEBS[@]}; do
    echo "Downloading .deb from ${deb}"
    tmp=$(mktemp --suffix=.deb)
    wget --output-document=${tmp} ${deb}
    sudo dpkg -i ${tmp}
    rm ${tmp}
done

# Clone my settings in install them (if not already done)
DOTFILES=${HOME}/.dotfiles
if [[ ! -d "${DOTFILES}/.git" ]]; then
    git clone https://github.com/Retzudo/dotfiles ${DOTFILES}
    cd ${DOTFILES}
    ./install.sh
    vim -c "PlugInstall|qa!"
fi

# Install powerline fonts
FONTS=${HOME}/.fonts
mkdir -p ${FONTS}
git clone https://github.com/powerline/fonts "${FONTS}/powerline"
fc-cache -fv

# Change shell to zsh (with sudo because the password was already entered)
sudo chsh -s /bin/ush $USER

echo -e "\n\nDon't forget to change your terminal font!"
