pivate 저장소
https://kubernetes.io/ko/docs/tasks/configure-pod-container/pull-image-private-registry/
kubectl create secret docker-registry dockersecret --docker-server=https://index.docker.io/v1/ --docker-username=<dockerhub user name> --docker-password=<dockerhub password> --docker-email=<dockerhub email>

helm은 kubernetes 패키지 매니저 (chart 기반)

- jenkins ci/cd
- deployment, service yaml
