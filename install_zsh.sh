#!/bin/bash

# 更新包管理器并安装 Zsh
echo "更新系统并安装 Zsh..."
sudo apt update && sudo apt install -y zsh

# 安装 Oh My Zsh
echo "安装 Oh My Zsh..."
sh -c "$(curl -fsSL https://gh.llkk.cc/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<EOF
y
EOF

# 安装 zsh-autosuggestions 插件
echo "安装 zsh-autosuggestions 插件..."
git clone https://gh.llkk.cc/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安装 zsh-syntax-highlighting 插件
echo "安装 zsh-syntax-highlighting 插件..."
git clone https://gh.llkk.cc/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 安装 Powerlevel10k 主题
echo "安装 Powerlevel10k 主题..."
git clone --depth=1 https://gh.llkk.cc/https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 修改 ~/.zshrc 文件
echo "配置 Zsh..."
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc
sed -i 's|^# DISABLE_MAGIC_FUNCTIONS="true"|DISABLE_MAGIC_FUNCTIONS="true"|' ~/.zshrc


# 确保 plugins 配置包含所需插件
if grep -q "^plugins=" ~/.zshrc; then
  sed -i 's|^plugins=(.*)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' ~/.zshrc
else
  echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc
fi

# 提示用户重启 shell
echo "配置完成！请重启 shell 或运行 'source ~/.zshrc' 应用配置。"
