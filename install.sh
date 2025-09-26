#!/bin/bash

# Centos Stream 9
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER 

echo "================================================"
echo "Docker 및 관련 패키지 설치가 완료되었습니다.       "
echo "재로그인 후 설정이 완료됩니다.                    "
echo "================================================"

