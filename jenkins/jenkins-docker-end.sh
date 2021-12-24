echo "down - jenkins docker"

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.jenkins.yml down

echo "complete - jenkins docker"
