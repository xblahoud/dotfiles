# Dotfiles

My default dotfiles. These include `.bashrc`, `profile`, compose-key configuration, files for `zsh`, and my configuration for `git` and [TexStudio].

## Requirements
Requires [Stow] (`sudo apt install stow`)

## Usage

The easiest way is to use the attached Makefile

```sh
make all
```

### Without make
By default, we need to first remove the old dotfiles and then `stow` the new
ones. Note the option `--dotfiles` of `stow`. This translates names like
`dot-xyz` to `.xyz`.

```bash
rm -f ~/.bashrc ~/.profile
rm -f ~/.XCompose
rm -rf ~/.gitconfig
rm -f ~/.zaliases ~/.zprofile ~/.zshrc
rm -rf ~/.config/texstudio

stow --dotfiles bash compose-keys git zsh texstudio
```

## WSL (Windows Subsystem for Linux)
The directory `bashwsl` contains a version of `bashrc` to be used exclusively
inside [WSL 2] instances with graphical output with [genie]. This version runs
some additional setup on session start.

The following code can be run in a script that automatically recognizes which
version of `bash` folder to use.

```bash
# Run stow
stow --dotfiles compose-keys git texstudio

if [ $WSL_DISTRO_NAME ]
then
  stow --dotfiles bashwsl zshwsl
else
  stow --dotfiles bash zsh
fi
```

[genie]: https://github.com/arkane-systems/genie
[Stow]: https://www.gnu.org/software/stow/
[TexStudio]: https://www.texstudio.org
[WSL 2]: https://docs.microsoft.com/en-us/windows/wsl/
