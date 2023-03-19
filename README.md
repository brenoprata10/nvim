# My config stuff
Nvim editor config files

## Useful guides
- [Setup ZSH](https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd)

## Install
- [Plug](https://github.com/junegunn/vim-plug)
- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [Zoxide](https://github.com/ajeetdsouza/zoxide#installation) - Better cd command
- [Exa](https://github.com/ogham/exa) - A modern replacement for ‘ls’ 
- [Bat](https://github.com/sharkdp/bat#installation) - A modern replacement to 'cat'
- [Node](https://www.itzgeek.com/how-tos/linux/fedora-how-tos/how-to-install-node-js-on-fedora.html)
- [RipGrip](https://github.com/BurntSushi/ripgrep#installation) - Better Fzf search behavior(properly excludes node_modules)
### Optional:
- [Ranger](https://github.com/ranger/ranger) - Vim Inspired File Manager
- [Rust ToolChain](https://www.rust-lang.org/tools/install) - Needed for SnipRun to work
- [TS Packages](`npm install -g ts-node typescript`) - Needed for SnipRun to work

## Git Config
- Store git credentials `git config --global credential.helper store`
- Set nvim as default editor:
 `export GIT_EDITOR=nvim && git config --global core.editor "nvim"` 

## TreeSitter
- TSInstall typescript
- TSInstall javascript
