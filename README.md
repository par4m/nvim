## Installation

Make sure you have curl and bash installed before you run this script.

```bash
curl -s https://raw.githubusercontent.com/par4m/nvim/main/install.sh | bash -s
```

## Manual Installation
```
git clone https://github.com/par4m/nvim ~/.config/nvim
nvim +PackerSync
```
## Requirements

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)
- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

## Post-Install

Open `nvim` and run,
`:PackerCompile profile=true`

## Java Debugging and Testing

```
git clone git@github.com:microsoft/java-debug.git
cd java-debug/
./mvnw clean install
```

```
git clone git@github.com:microsoft/vscode-java-test.git
cd vscode-java-test
npm install
npm run build-plugin
```
