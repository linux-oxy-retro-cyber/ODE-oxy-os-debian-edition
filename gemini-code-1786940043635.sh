# Cria as pastas necessárias no skel se não existirem
mkdir -p /etc/skel/.config/dconf
mkdir -p /etc/skel/.config/fastfetch

# Copia o banco de dados do GNOME/DConf
cp -f ~/.config/dconf/user /etc/skel/.config/dconf/

# Copia a config do fastfetch (caso esteja na sua home)
cp -rf ~/.config/fastfetch/* /etc/skel/.config/fastfetch/