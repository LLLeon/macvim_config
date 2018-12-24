# macvim_config

主要是 Golang 开发环境。

#### 1. 安装 MacVim

`brew install macvim --with-lua`

> - 需要安装完整的 Xcode；
> - neocomplete 插件需要 `lua` 支持。

#### 2. 安装插件

安装 vim 插件管理器 [Vundle](https://github.com/VundleVim/Vundle.vim)

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

执行 `mvim ~/.vimrc` 后，在 vim 命令模式执行：`:PluginInstall`。

#### 3. 安装字体

vimrc 中已配置 [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) 字体，[下载字体](https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip) 解压后，进入`TTF`目录 全选所有字体打开，安装字体。

#### 4. 配置皮肤

```bash
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim
```

#### 5. 插件依赖

> 1. **ctrsf.vim 插件依赖：** `brew install ack`
> 2. **tagbar 插件依赖：** `brew install ctags`
> 3. **vim-go 插件依赖：** vim中执行 `:GoInstallBinaries`

#### 6. 编译 YCM

需要安装 cmake：Mac 通过 `brew install cmake` 安装。

```bash
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --gocode-completer
```

