# 版本信息：

```bash
➜  ~ screenfetch 

 ██████████████████  ████████     ljzsdut@ManjaroLjz
 ██████████████████  ████████     OS: Manjaro 18.0.4 Illyria
 ██████████████████  ████████     Kernel: x86_64 Linux 4.19.49-1-MANJARO
 ██████████████████  ████████     Uptime: 14h 1m
 ████████            ████████     Packages: 1163
 ████████  ████████  ████████     Shell: zsh 5.7.1
 ████████  ████████  ████████     Resolution: 1366x768
 ████████  ████████  ████████     DE: KDE 5.59.0 / Plasma 5.15.5
 ████████  ████████  ████████     WM: KWin
 ████████  ████████  ████████     GTK Theme: Breath [GTK2/3]
 ████████  ████████  ████████     Icon Theme: maia
 ████████  ████████  ████████     Font: Noto Sans Regular
 ████████  ████████  ████████     CPU: Intel Core i5-2450M @ 4x 3.1GHz [48.0°C]
 ████████  ████████  ████████     GPU: Mesa DRI Intel(R) Sandybridge Mobile 
                                  RAM: 1328MiB / 7919MiB

```

# 设置国内源&更新操作系统

官方镜像源（包括 core， extra， community， multilib ）

```bash
sudo pacman-mirrors -i -c China -m rank //更新镜像排名，勾选某个地址后，然后按 OK 键两次。
sudo pacman -Syy //更新数据源
```

添加archlinuxcn软件源：
编辑nano /etc/pacman.conf，在最下方添加：

```bash
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```


更新软件源并导入公钥：
```bash
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
```


升级系统

```bash
sudo pacman -Syyu
```



# 修改Home下的目录为英文

修改目录映射文件名:

```bash
vim ~/.config/user-dirs.dirs
```

修改为以下内容：

```bash
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Musics"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

将Home目录下的中文目录名改为对应的中文名:

```bash
cd ~
mv 公共 Public
mv 模板 Templates
mv 视频 Videos
mv 图片 Pictures
mv 文档 Documents
mv 下载 Downloads
mv 音乐 Musics
mv 桌面 Desktop
```
# 安装必备字体
```bash
sudo pacman -S ttf-font-awesome wqy-bitmapfont wqy-microhei  wqy-zenhei nerd-fonts-complete
```
# 关闭KDE Kwallet（电子钱包）

 用了kde以后，每次打开浏览器都会跳出电子钱包什么的，十分烦人，也可能是我自己不习惯

 于是就想办法把他关掉！

 搜索Kwallet，不是KwalletManager

 然后把启用的勾勾去掉就好啦

# [kde钱包 忘记密码](https://www.cnblogs.com/warling/p/8810278.html)

修改 ~/.config/kwalletrc文件的First Use=false 改成 true 应该可以重置 kwallet（存储的密码全没），或者删除 ~/.local/share/kwalletd 应该也是一个效果。

我是修改kwalletrc文件不起作用，删掉~/.local/share/kwalletd之后，可以重新设置密码

 

还有一个详细的说明：https://chakra-zh.blogspot.com/2016/03/kwallet-password-manager.html

# 安装拼音输入法

安装fcitx小企鹅输入法基础库及其配置工具

```bash
sudo pacman -S fcitx-im fcitx-configtool
```

在 Fcitx 支持的拼音输入法中，内置拼音响应速度最快。Fcitx 同样支持流行的第三方拼音输入法以提供更好的整句输入效果.

可选安装第三方输入法，fcitx默认已有中文输入。 [其他输入法安装参考](https://wiki.archlinux.org/index.php/Fcitx_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E5.AE.89.E8.A3.85 )

```bash
sudo pacman -S fcitx-googlepinyin
sudo pacman -S fcitx-sogoupinyin fcitx-qt4  #可选1：搜狗拼音
sudo pacman -S fcitx-sunpinyin    #可选2：sun拼音
```

安装完成后，新建并配置~/.xprofile，添加如下内容：

```bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=“@im=fcitx”
```

```bash
cat ~/.profile
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/palemoon
fcitx -rd &
```
注销用户重新登录或者手动启动fcitx: `fcitx -rd`。

说明：要保证LC_CTYPE变量的值为“zh_CN.UTF-8”，否则无法切换出中文输入法。

# 安装chrome浏览器

```bash
sudo pacman -S google-chrome
或者：chromium
```



# 安装tim

[参考链接]: https://www.lulinux.com/archives/1319

```bashpacman -S deepin.com.qq.office
sudo pacman -S deepin.com.qq.office
```

**安装好的TIM打不开：**先安装gnome-settings-daemon，然后将/usr/lib/gsd-xsettings设置为自动启动；

```bash
sudo pacman -S gnome-settings-daemon
ln -sv /usr/lib/gsd-xsettings ~/.config/autostart-scripts 
```

# 安装微信

```bash
yaourt --S electronic-wechat
```

或：sudo pacman -S electronic-wechat



# 办公软件WPS

安装软件和缺失字体：

```bash
sudo pacman -S wps-office
sudo pacman -S ttf-wps-fonts
```

解决无法输入中文问题：
sudo vim /usr/bin/wps，在第一行（#!/bin/bash）下面添加：

```bash
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE="fcitx"
gOpt=
#gOptExt=-multiply
gTemplateExt=("wpt" "dot" "dotx")
```

# 深度截图

小巧强大的截图工具[深度截图](https://github.com/linuxdeepin/deepin-screenshot)：

```bash
sudo pacman -S deepin-screenshot
```

配置快捷键：
打开系统设置-->快捷键—>自定义快捷键-->截图–->编辑-->新建-->全局快捷键-->命令/URL(可对命令进行改名)-->触发器（配置快捷键）—>动作---->填上deepin-screenshot--应用

其他截图工具：flameshot（调用方法：flameshot gui）

# 安装分屏软件tmux（可选）

```bash
yaourt -S tmux
```

# vscode

```bash
yaourt visual-studio-code  或sudo pacman -S visual-studio-code-bin
```

# sublime-text

如果我们直接使用命令行安装后的sublime是不支持中文输入的。

可以按sublime官方安装方法如下：

1. 首先安装 GPG key , 终端输入如下：

```bash
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
```

2. 选择版本，稳定版还是开发版

Stable

```bash
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
```

Dev

```bash
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/dev/x86_64" | sudo tee -a /etc/pacman.conf
```

3. 更新及安装Sublime Text

```bash
sudo pacman -Syy sublime-text
```

# 远程桌面连接

使用Octopi安装remmina，组件全选。

或 

```bash
sudo pacman -S remmina
```



# 视频播放mpv

```bash
sudo yaourt -S mpv
```

mpv快捷键使用说明

| 按键 | 说明 |
| ---- | ---- |
| 1	|对比度 -|
|2|对比度+|
|3|亮度 -|
|4|亮度+|
|5|伽马 -|
|6|伽马+|
|7|饱和度 -|
|8|饱和度+|
|9|音量减小|
|0|音量增加|
|上方向键|播放进度快进1分钟|
|下方向键|播放进度快退1分钟|
|左方向键|播放进度后退5秒|
|右方向键|播放进度前进5秒|
|ctrl与 - 号组合 |音轨和视频的调节（音轨快进一些）|
|CTRL与+号组合 |音轨和视频的调节（音轨减慢一些）|
|p或者空格| 暂停|
|i  |显示视频的详情参数|
|m |静音|
|z |字幕后退|
|x|前进|
|f|全屏|
|q |退出|
|shift+Q|退出并自动保存播放位置|
|＃|切换音频轨，多音频的可以用|
|j |切换字幕，多字幕的时候可以使用|
|J 大写|反方向的切换字幕|
|[或{   |播放速度减慢，变化速度不一样|
|]或}   |播放速度加快，倍速变化速度不一样|
|backspace |播放速度返回到一倍速|
|< |逐帧播放|

# 安装下载工具 uget

```bash
sudo yaourt -S uget 
```

# 安装pdf阅读器

```bash
sudo yaourt foxit
```

# 安装markdown编辑器

```bash
sudo yaourt typora
```

# zsh&oh-my-zsh，安装，主题配置方法

## zsh安装

```bash
sudo pacman -S zsh
```

## oh-my-zsh安装

https://www.jianshu.com/p/0f3dcec21a97

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## oh-my-zsh插件之zsh-syntax-highlighting

1. Clone this repository in oh-my-zsh's plugins directory:

   ```bash
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

2. Activate the plugin in `~/.zshrc`:

   ```bash
   plugins=( [plugins...] zsh-syntax-highlighting)
   ```

3. Restart zsh (such as by opening a new instance of your terminal emulator).

## oh-my-zsh插件之zsh-autosuggestions

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

   ```bash
   plugins=(zsh-autosuggestions)
   ```

3. 编辑`~/.zshrc`配置文件，绑定快捷键，默认接受建议的快捷键为`ctrl+f`

   ```bash
   bindkey ',' autosuggest-accept
   ```

4. Start a new terminal session.

## autojump安装

Grab a copy of autojump:

```bash
git clone git://github.com/wting/autojump.git
```

Run the installation script and follow on screen instructions.

```bash
cd autojump
./install.py or ./uninstall.py
```

# 录屏软件

SimpleScreenRecorder

```bash
sudo pacman -S simplescreenrecorder
```



# 其他参考资料：

https://www.jianshu.com/p/869e60e661ff



# KDE美化

https://www.bilibili.com/video/av40094127?from=search&seid=13229793831360516797

- 替换桌面背景
- 调整konsole的透明度为10%左右。
- 安装zsh、oh-my-zsh
- 安装cmatirx，在.zshrc最后配置`cmatrix -b -C blue -s`
- 安装latte-docker，启用并设置：启用高级选项，“外观”设置：大小48px，小部件距离40%，背景不启用。
- 删除原生的面板。右键添加面板-->应用程序菜单栏-->增加部件-->右边从右到左依次：锁定/注销、搜索、系统托盘、系统负载查看器、获取新的部件(netspeed widget)并安装使用、数字时钟。左边从左到右依次：应用程序菜单、获取新的部件(application title)并安装使用（No active window label：自定义文本;Text type：Application Name）  。此外，设置面板高度为20，右对齐。最后锁定面板
- 系统设置-->应用程序风格-->桌面装饰-->获取新窗口装饰-->搜索“**Breezemite**”-->安装-->关闭下载窗口-->应用breezemite-->“按钮”选项卡-->删除标题栏中所有的按钮-->在右边依次添加：关闭、最大化、最小化-->应用
- 系统设置-->应用程序风格-->图标-->获取新图标主题-->搜索“macos”-->安装“la-capitaine”
- 系统设置-->开机关机-->登陆屏幕-->主题：微风-->应用。


# pacman使用

```bash
pacman -S vim       #安装软件vim
pacman -Sy          #更新本地软件索引库（可能不更新）
pacman -Syy         #强制更新本地软件索引库
pacman -Su          #更新所有软件
pacman -Syu         #更新本地索引库，并更新软件所有软件或g指定软件
pacman -Syyu        #强制更新本地索引库，并更新所有软件
pacman -Syyu xxx    #强制更新本地索引库，并更新所有软件,然后安装xxx。
pacman -Ss xxx  	#从远程库中查找给定信息的软件。支持正则表达式

pacman -R vim  		#删除软件vim
pacman -Rc vim  	#删除软件vim及依赖于vim的包
pacman -Rs vim		#删除软件vim及其依赖包
pacman -Rns vim 	#删除软件vim及其依赖包（只被他依赖），-n同时删除vim的全局配置文件的备份.pacsave（不会个人配置文件.vimrc的备份）

pacman -Q  			#查看本机安装所有打软件
pacman -Qe 			#查看本机自己安装的软件，排除系统软件
pacman -Qeq			#-q只显示软件名，不显示软件版本号
pacman -Qs vim 		#查找本机软件中含有vim的软件
pacman -Qdt			#不再被依赖的无用依赖包

#删除无用的依赖
pacman -Q $(pacman -Qdtq)




Pacman 是一个命令行工具，这意味着当你执行下面的命令时，必须在终端或控制台中进行。

1、更新系统

在 Arch Linux 中，使用一条命令即可对整个系统进行更新：

pacman -Syu

如果你已经使用 pacman -Sy 将本地的包数据库与远程的仓库进行了同步，也可以只执行：

pacman -Su

2、安装包

pacman -S 包名 例如，执行 pacman -S firefox 将安装 Firefox。你也可以同时安装多个包，只需以空格分隔包名即可。
pacman -Sy 包名 与上面命令不同的是，该命令将在同步包数据库后再执行安装。
pacman -Sv 包名 在显示一些操作信息后执行安装。
pacman -U 安装本地包，其扩展名为 pkg.tar.gz。
3、删除包

pacman -R 包名 该命令将只删除包，不包含该包的依赖。
pacman -Rs 包名 在删除包的同时，也将删除其依赖。
pacman -Rd 包名 在删除包时不检查依赖。
4、搜索包

pacman -Ss 关键字 这将搜索含关键字的包。
pacman -Qi 包名 查看有关包的信息。
pacman -Ql 包名 列出该包的文件。
5、其他用法

pacman -Sw 包名 只下载包，不安装。
pacman -Sc Pacman 下载的包文件位于 /var/cache/pacman/pkg/ 目录。该命令将清理未安装的包文件。
pacman -Scc 清理所有的缓存文件。
```



# i3的使用

[用户文档中文](https://www.jianshu.com/p/b9b644cf528f)

<https://www.jianshu.com/p/99e51eb15abc> 





# 修改时间显示为英文格式：

```bash
 sudo localectl set-locale LC_TIME="en_US.UTF-8"
```

重启后生效。

# 安装alacritty终端模拟器

```bash
sudo pacman -S alacritty
```

在其配置文件中配置环境i变量LC_CTYPE="en_US.UTF-8"，配置格式如下：

```yaml
env:
  # TERM variable
  #
  # This value is used to set the `$TERM` environment variable for
  # each instance of Alacritty. If it is not present, alacritty will
  # check the local terminfo database and use `alacritty` if it is
  # available, otherwise `xterm-256color` is used.
  #TERM: xterm-256color
  LC_CTYPE: en_US.UTF-8
```

# 键位修改

## 调换Esc和CapsLK键位



# vim使用教程

格式：<操作> <动作>

## 操作

### y：复制操作

### d:删除操作

d→：向右删除1个字符

d3→：向右删除3个字符

dd：删除整行

3dd：删除3行

### c：改变change，删除指定字符后进入插入模式





## 动作：

### hjkl：左、下、上、右

### w：word，向后移动一个word

### b：back 向前移动一个word

### i：in，操作指定范围内的字符，例如{}，“”，<>

示例：

- ciw：change in word

- yi“：复制双引号内的字符
- di{：删除{}内的字符

###  f ： find（查找），移动到指定指定字符，例如f”，移动到下一个“的位置

示例：

- df:   删除到冒号的位置（从当前位置一直删除到第一个冒号的位置）
- yf”   复制到引号的位置
- cf:   修改到冒号

### t：to(到某个位置)，使用同f，只不过光标会位于指定字符的前一个字符上



可视化模式：

- v  ：进入普通可视化模式
- shift+v  :  可视行模式 ，v或V模式下，选中后的批量操作：选中后，输入":nromal+空格+其他命令行模式的操作"
- ctrl+v  :  可视块模式，选中后直接可以进行命令行模式的操作



## 分屏：

:split(:sp)或:vspblit(:vs)

分屏后打开新的文件：     使用“:e+空格+文件路径”        (edit)

## 标签页：

新建标签页   “:tabe”

移动到左边标签页：  “:-tabnext”

移动到右边标签页：  “:+tabnext”



## 读取命令行输出到文件中

":r !cat /etc/xxx"



## 数字的自增自减

ctrl+a  对选中的数字+1

ctrl+x  对选中的数字-1


# 更改i3status
mkdir ~/.config/i3status
cp /etc/i3status.conf ~/.config/i3status/config
vim ~/.config/i3status/config
改成
tztime local {
format = " %Y-%m-%d %H:%M:%S "
}
就能按照年月日显示时间格式了。
如果要显示详细的i3status的资料：
man i3status

#更改conky
/usr/share/conky/conky_maia    #桌面右侧的状态栏
/usr/share/conky/conky1.10_shortcuts_maia    #桌面左侧的快捷键显示栏
修改conky_maia支持中文
font = 'WenQuanYi Micro Hei:size=8',
或者
font = 'WenQuanYi Zen Hei:size=8',


参考：
https://www.jianshu.com/p/cf14660d8af2
https://www.cnblogs.com/vachester/p/5649813.html
