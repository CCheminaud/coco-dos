# Coco-Dos

Coco-Dos is a small configuration for ZSH which uses [Antigen](https://github.com/zsh-users/antigen)
plugin manager and [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme.

<p align="center">
  <img src="./screenshot.png" >
</p>

## Installation

In order to use this theme, you have to install Antigen first.

```shell
cd ~
mkdir .antigen
curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > .antigen/antigen.zsh
```

Then, download and install the powerline patched font.

```shell
curl https://github.com/CCheminaud/coco-dos/raw/master/fonts/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf > .fonts/SourceCodePro-Powerline-Awesome-Regular.ttf
fc-cache -fv
```

Last step, download the `.zshrc` in your home directory.

```shell
curl https://github.com/CCheminaud/coco-dos/raw/master/.zshrc
```

With Antigen, all plugins and themes will be installed the next time ZSH is launched !
