#!/bin/bash

# Centos Stream 9
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER 

# ==========================================================
# ★★★ dkstop alias 설정 수정된 부분 ★★★
# ==========================================================
DKSTOP_ALIAS='alias dkstop="docker stop \$(docker ps -aq) && docker rm -f \$(docker ps -aq)"'

# 스크립트를 sudo로 실행한 사용자 이름 (예: docker)을 가져옵니다.
TARGET_USER=${SUDO_USER:-$(whoami)}

# 해당 사용자의 .bashrc 파일 경로를 정의합니다.
TARGET_BASHRC="/home/$TARGET_USER/.bashrc"

# 사용자의 .bashrc 파일에 alias 추가
grep -qxF "$DKSTOP_ALIAS" "$TARGET_BASHRC" 2>/dev/null || echo "$DKSTOP_ALIAS" >> "$TARGET_BASHRC"

# .bashrc 파일의 소유권이 root로 남아있지 않도록 해당 사용자에게 변경 (중요)
chown $TARGET_USER:$TARGET_USER "$TARGET_BASHRC" 2>/dev/null
# ==========================================================
echo "✅ 설치 완료 및 버전 확인 결과"
echo "================================================"

echo "1. Git 버전:"
# 명령어가 없는 경우 오류 대신 메시지를 출력하도록 처리 (2>/dev/null)
git --version 2>/dev/null || echo "Git 설치 확인 불가"

echo "2. Docker 버전:"
docker --version 2>/dev/null || echo "Docker 설치 확인 불가"

echo "3. Docker Compose 버전 (V2):"
docker compose version 2>/dev/null || echo "Docker Compose 설치 확인 불가"

echo ""
echo "================================================"
echo "🚨 중요: 재로그인 안내"
echo "Docker 사용 권한을 적용하려면 반드시 [로그아웃 후 다시 로그인]해야 합니다."
echo "재로그인 후 'docker compose up -d' 명령어를 실행하세요."
echo "================================================"

sleep 2

newgrp docker
