# Dotfiles

My default dotfiles

## Usage

Requires [Stow] (`sudo apt install stow`)

By default, we need to first remove the old dotfiles and then stow the new ones.

```bash
rm ~/.bashrc ~/.profile
rm ~/.gitconfig
rm ~/.zaliases ~/.zprofile ~/.zshrc
stow bash git zsh
```

[Stow]: https://www.gnu.org/software/stow/
