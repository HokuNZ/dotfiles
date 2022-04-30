if (( $(command -v brew) == "" ))
then
    echo "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed"
    echo $(which brew)
fi

echo "› \033[00;34mbrew update\033[0m"
brew update
echo "› \033[00;34mbrew bundle\033[0m"
brew bundle --file $DOTFILES/apps/homebrew/Brewfile --mas