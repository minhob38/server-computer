# jenkins docker

jenkins docker image 및 container를 만듭니다.

## 실행

`jenkins-docker-begin.sh`로 jenkins container를 만들며, `jenkins-docker-end.sh`로 jenkins container를 종료시킵니다.

## 소스파일

jenkins-docker의 souece file들은 아래와 같습니다.

### • jenkins-docker-begin.sh

docker-compose.jenkins.yml을 실행시켜 jenkins container를 만듭니다.

### • jenkins-docker-end.sh

docker-compose.jenkins.yml로 만들어진 jenkins container를 종료시킵니다.

### • Dockerfile.jenkins

jenkins official image를 기반으로, unix socket 통신을 위해 jenkins 안에 docker를 설치합니다.

### • docker-compose.jenkins.yml

만들어진 jenkins image를 기반으로, container를 만듭니다. 이때 jenkins container를 종료해도 다음에 저장된 jenkins 설정을 사용하기 위해, host의 `jenkins_home`와 image의 `jenkins_home`을 volume으로 만듭니다. 또한 unix socket 통신을 위해 host의 `/var/run/docker.sock`와 container의 `/var/run/docker.sock`을 volume으로 만듭니다.

### • install-docker.sh

jenkins 안에 debian을 기반으로 docker를 설치합니다.

### • install-ngrok.sh

jenkins 안에 linux 기반으로 ngrok을 설치합니다.
