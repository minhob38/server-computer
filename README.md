# Server Compute

서버환경(ubuntu)을 Docker기반으로 설정하는 소스코드입니다.

## 환경설정

### • Github 저장소 가져오기

서버환경을 설정할 소스코드를 github에서 가져옵니다.

```
git clone https://github.com/minhob38/server-computer.git ~/server-computer
```

```
git pull origin master
```

### • Docker 설치

아래 스크립트로 Docker(Ubuntu)를 설치합니다.

```
$ sh ~/server-computer/programs/install_docker.sh
```

### • Jenkins 설치 및 실행

아래 스크립트로 Jenkins 도커이미지를 만들고 컨테이너를 실행시킵니다.

```
$ sh ~/server-computer/dockers/jenkins/jenkins_up.sh
```

### • nginx 설치 및 실행

아래 스크립트로 nginx 도커이미지를 만들고 컨테이너를 실행시킵니다.

```
$ sh ~/server-computer/dockers/nginx/nginx_up.sh
```

### • application server 설치 및 실행

실행할 애플리케이션 서버의 소스코드를 github에서 가져옵니다.

```
$ git clone https://github.com/minhob38/express-server ~/server
```

## 배포환경
