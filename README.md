# PDE environment setup.

Clone this repository in `~/dotfiles` directory.

Install Required packages

- zsh
- tmux
- neovim
- stow

```
sudo pacman -S zsh tmux neovim stow
```

After that run this command to create symlinks for `~/dotfiles` to `$HOME` directory.

```
stow --adopt .
```

Now follow the instruction to configure each piece of component.

## ZShell

**Prerequisites**

- Zinit
- Powerlevel10k

**Clone & configure zinit**

```
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

**Clone Powerlevel10k repository**

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

```
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

`Note: Install nerd font if its not installed already.`

After that follow the instructions provided by the powerlevel10k promt

## Tmux

**Prerequisites**

- tpm

`Note: Required only if automatic installation failed`

**Clone tmp repository**

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now launch tmux and it should run fine.
