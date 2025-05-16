## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into new hidden directory.

# use HTTPS and switch remotes later. (use your repo link)
# clone this in your home. So cd ~/dotfiles will work
```zsh
git clone https://github.com/anirudhsalgundi/dotfiles.git
```

3. Create symlinks in the Home directory to the real files in the repo.

# open a file called stow-all.sh. 

```zsh
vim stow-all.sh
```

# Copy all the contents

```zsh
#!/bin/bash
# stow-all.sh
cd ~/dotfiles || exit 1
for dir in */ ; do
    [ -d "$dir" ] && stow "$dir"
done
```

# make the file executable
```zsh
chmod +x stow-all.sh
```

#run the script

```zsh
./stow-all.sh
```

4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/dotfiles/brew/Brewfile

# ...or move to the directory first.
cd ~/dotfiles/brew && brew bundle
```

## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like [Dotbot](https://github.com/anishathalye/dotbot).
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a [bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
- Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io/).


# I have taken inspiration from https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds and edited README.md to work for this repo

## Thank you


