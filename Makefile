
ifdef WSL_DISTRO_NAME
zshdir = zshwsl
bashdir = bashwsl
else
zshdir = zsh
bashdir = bash
endif

all: bash compose-keys git texstudio zsh

zsh: ~/.zshrc
bash: ~/.bashrc
compose-keys: ~/.XCompose
git: ~/.gitconfig
texstudio: ~/.config/texstudio

~/.zshrc: $(zshdir)/dot-zshrc $(zshdir)/dot-zprofile $(zshdir)/dot-zaliases
	rm -f ~/.zaliases ~/.zprofile ~/.zshrc
	stow --dotfiles $(zshdir)

~/.bashrc: $(bashdir)/dot-bashrc $(bashdir)/dot-profile
	rm -f ~/.bashrc ~/.profile
	stow --dotfiles $(bashdir)

~/.XCompose: compose-keys/dot-XCompose
	rm -f ~/.XCompose
	stow --dotfiles compose-keys

~/.config/texstudio: texstudio/.config/texstudio/
	rm -rf ~/.config/texstudio
	stow --dotfiles texstudio

~/.gitconfig: git/dot-gitconfig
	rm -rf ~/.gitconfig
	stow --dotfiles git
