# Server Compute

서버환경(ubuntu)을 Docker기반으로 설정하는 소스코드입니다.

## 환경설정

### • Github 저장소 가져오기

```
git clone https://github.com/minhob38/server-computer.git ~/server-computer
```

```
git pull origin master
```

### • Jenkins 설치 및 실행

아래 스크립트로 Jenkins 도커이미지를 만들고 컨테이너를 실행시킵니다.

```
$ cd ~
$ sh docker/jenkins/jenkins_up
```

## 배포환경
