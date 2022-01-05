echo "=== jenkins up ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.jenkins.yml up -d
# sudo docker exec -it jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
