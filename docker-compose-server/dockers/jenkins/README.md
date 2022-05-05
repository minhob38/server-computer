# jenkins docker

jenkins docker image 및 container를 만듭니다.

## 실행

`jenkins_up.sh`로 jenkins container를 만들며, `jenkins_down.sh`로 jenkins container를 종료시킵니다.

## 소스파일

jenkins-docker의 souece file들은 아래와 같습니다.

### • jenkins_up.sh

docker-compose.jenkins.yml을 실행시켜 jenkins container를 만듭니다.

### • jenkins_down.sh

docker-compose.jenkins.yml로 만들어진 jenkins container를 종료시킵니다.

### • Dockerfile.jenkins

jenkins official image를 기반으로, unix socket 통신을 위해 jenkins 안에 docker를 설치합니다.

### • docker-compose.jenkins.yml

만들어진 jenkins image를 기반으로, container를 만듭니다. 이때 jenkins container를 종료해도 다음에 저장된 jenkins 설정을 사용하기 위해, host의 `jenkins_home`와 image의 `jenkins_home`을 volume으로 만듭니다. 또한 unix socket 통신을 위해 host의 `/var/run/docker.sock`와 container의 `/var/run/docker.sock`을 volume으로 만듭니다.

### • install_docker.sh

jenkins 안에 debian을 기반으로 docker를 설치합니다.

### • install_editor.sh

jenkins 안에 debian을 기반으로 ngrok을 설치합니다.

### • install_ngrok.sh

jenkins 안에 debian을 기반으로 nano을 설치합니다.

## jenkins 설정

### • credential 설정

다른 API(github, dockerhub)와 연동하기 위한 credential을 설정합니다.  
credential에는 아래 값들을 정의합니다. (jenkins 관리 → manage credentials)  
\- username: 다른 API의 계정  
\- password: 다른 API의 비밀번호(또는 api key / token)  
\- id: jenkins안에서 credential을 식별하기 위한 id

### • github 연동

github 서버를 설정하며, github api key를 secret text로 등록합니다.(jenkins관리 → 시스템설정)  
GitHub hook trigger for GITScm polling로 빌드유발을 설정하여, github webhook을 받을 수 있도록합니다.  
📝 github webhook은 아래 url로 설정합니다.  
`http://[jenkins ip]:[jenkins port]/github-webhook/`

### • publish over ssh

jenkins가 ssh로 remote server를 원격으로 제어할 수 있도록 설정합니다. publish over ssh 플러그인을 설치하고, ssh를 설정합니다. client server(jenkins server)와 remote server ssh 설정은 아래와 같습니다. (jenkins관리 → 시스템설정)

**\- jenkins ssh key**  
phrase: key의 phrase  
key: ssh private key 입력

**\- ssh servers**  
name: ssh server 이름 (식별하기 위한 이름이기에, 편하게 지으면 됩니다.)  
host name : remote server의 ip  
user name : remote server에 접속할 계정  
remote directory: 접속할 경로

📝 remote server의 ~/.ssh에 public key를 authorized_keys로 저장합니다.

### • 빌드 유발

**\- 빌드를 원격으로 유발**  
jenkins가 webhook을 받아, job을 실행합니다. 이때 webhook은 `http://[jenkins ip:port]/job/[job 이름]/build?token=[token]`으로 요청해야하며, jenkins의 인증도 필요하기에 `http://[jenkins id]:[jenkins password 또는 api key]@[jenkins ip: port]/job/[job 이름]/`으로 보내줍니다.

📝 jenkins 인증을 위한 api key를 함께 보내야합니다.api key는 (jenkins 관리 → manage users)에서 받을 수 있습니다.

**\- GitHub hook trigger for GITScm polling**
github 서버를 설정한 뒤, 해당 저장소에서 webhook을 보내면 jenkins가 job을 진행하도록 설정합니다.
