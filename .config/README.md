# Dev env things
Configurations for dev tools, to be copied into the home dir

Use a bare repo
```
git init --bare $HOME/.cfg

# in zshrc or bashrc
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config config --local status.showUntrackedFiles no
```
To save nvim config: 
`config add ~/.config/nvim`
`config commit -m "update nvim"` 
`config push`

## Nvim Version
```
NVIM v0.11.5
Build type: Release
LuaJIT 2.1.1741730670
```

### Installing Latest Stable Neovim
#### Linux
```bash
# Move to your downloads or temp folder
cd /downloads

# Download the stable Linux x64 release
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz

# Extract it
tar xzf nvim-linux-x86_64.tar.gz

# Move the files to /usr/local 
sudo cp -r nvim-linux-x86_64/bin/* /usr/local/bin/
sudo cp -r nvim-linux-x86_64/lib/* /usr/local/lib/
sudo cp -r nvim-linux-x86_64/share/* /usr/local/share/
```
