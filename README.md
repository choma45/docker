# Docker 프로젝트 설정 가이드

이 프로젝트는 Docker 컨테이너를 사용하여 여러 서비스를 배포합니다.

## 사전 설정
sudo dnf install -y git

## 1단계: 프로젝트 클론 
```bash 
git clone [https://github.com/choma45/docker.git](https://github.com/choma45/docker.git)
cd docker

## 2단계: 환경 설정 스크립트 실행
sudo sh install.sh

## 3단계: 서비스 실행
docker-compose up -d
