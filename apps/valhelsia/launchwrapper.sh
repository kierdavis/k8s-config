#!/bin/sh
set -eu

if [ ! -e /minecraft/ServerStart.sh ]; then
  mkdir -p /tmp/minecraft
  cd /tmp/minecraft
  unzip /minecraft.zip
  cd *
  mv * /minecraft
fi

if [ -e /config ]; then
  for src_path in /config/*; do
    dest_path="/minecraft/$(basename "$src_path")"
    if [ -e "$dest_path" ]; then
      mv "$dest_path" "$dest_path.bak"
    fi
    ln -sfTv "$src_path" "$dest_path"
  done
fi

cd /minecraft
chmod +x ServerStart.sh
echo eula=true > eula.txt

exec ./ServerStart.sh
