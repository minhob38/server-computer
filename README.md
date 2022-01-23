# Server Computer

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

아래 스크립트로 jenkins 도커이미지를 만들고 컨테이너를 실행시킵니다. jenkins는 설정된 job을 실행합니다.

```
$ sh ~/server-computer/dockers/jenkins/jenkins_up.sh
```

### • nginx 설치 및 실행

아래 스크립트로 nginx 도커이미지를 만들고 컨테이너를 실행시킵니다. nginx는 webserver로 static file을 응답하고, reverse proxy로 api요청을 backend애 전달 및 로드밸런싱합니다.

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

### • backend server 실행(배포)

아래 스크립트로 dockerhub에서 이미지를 pull하여, 도커 컨테이너로 순차적으로 backend server실행시킵니다.  
🔐 환경변수 파일을 jenkins에 넣어주고, backend server 컨테이너 실행 시 볼륨으로 올려줍니다.

```
$ sh ~/backend/deploy_backend.sh
```

### • frontend server 실행(배포)

frontend의 static file을 `~/frontend`에 위치시키면, nginx가 경로를 읽어 응답합니다.
