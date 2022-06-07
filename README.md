# My dotfiles collection

### Copy home
- (Linux) `find . -mindepth 1 -maxdepth 1 -exec mv -t.. -- {}`
- (Mac)   `find . -mindepth 1 -maxdepth 1 -execdir mv '{}' .. \;`

### Dependencies
- `pip install pylon proselint flake8 pynvim neovim neovim-remote jedi`
- `apt install ctags xdotool`

### Install Neovim
Install neovim, from latest stable [release](https://github.com/neovim/neovim/releases/) or from [brew](https://docs.brew.sh/Installation) if you use macOs.
I strongly suggest the use of a smart terminal as [iTerm](https://www.iterm2.com/), it will be easier to setup colors.

Example: install neovim with appimage
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```
### Install NeoVim Plugins
- Once you open nvim for the first time, PlugInstall will automatically install all the plugins.
- If during the plugins installation something fails, just run again the `:PlugInstall` command.
- **[Important]** run `:UpdateRemotePlugins` to update the plugin manifest and register remote plugin commands and functions.


### Termcolors
- Latest tmux is necessary to have right term colors
http://witkowskibartosz.com/blog/update-your-tmux-to-latest-version.html
- how to test colors in your terminal: https://gist.github.com/XVilka/8346728

### NerfFonts
- [GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 40+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more](https://github.com/ryanoasis/nerd-fonts)

### The SilverSearcher
- [Faster Grepping in Vim](https://thoughtbot.com/blog/faster-grepping-in-vim)
