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

<!-- ### • application server 설치 및 실행

실행할 애플리케이션 서버의 소스코드를 github에서 가져온 뒤, 도커이미지를 만들고 컨테이너를 실행시킵니다.
🔐 환경변수 파일을 서버의 소스코드(원래 위치)에 넣어줍니다.
😮 애플리케이션 서버에 Dockerfile / docker-compose.yml을 만들어두어야 합니다.

```
$ sh ~/server-computer/server/server_up.sh
``` -->

### • application server 설치 및 실행

## 서버환경

도커로 이루어져있으며,

### • nginx

nginx는 정적파일(react)를 응답하며, api 서버에 로드밸런싱을 해줍니다.

### •

jenkins를 기반으로 ci/cd를 구축합니다. github 저장소(application server)에 소스코드가 바뀌면 jenkins에 webhook을 요청합니다. jenkins는 설정된 job에 따라 application server 소스코드를 pull한 뒤, 도커 이미지 생성 및 컨테이너를 실행시킵니다. 이때 nginx를 통해 무중단배포(rolling 방식)이 이루어집니다.
