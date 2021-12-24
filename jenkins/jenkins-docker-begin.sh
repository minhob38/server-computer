echo "up - jenkins docker"

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.jenkins.yml up -d
sudo docker exec -it jenkins-server cat /var/jenkins-volume/secrets/initialAdminPassword

echo "complete - jenkins docker"
