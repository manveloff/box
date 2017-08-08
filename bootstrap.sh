#!/usr/bin/env bash

# Установить docker
curl -sSL https://get.docker.com/ | sh

# Установить docker-compose
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Настроить PS1 prompt
sed -i -e '$aPS1='\''\\s->\\W\\$ '\' /home/vagrant/.bashrc

# Создать группу docker и добавить в неё пользователя vagrant
sudo usermod -aG docker vagrant
