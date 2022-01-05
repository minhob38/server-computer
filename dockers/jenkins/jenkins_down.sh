echo "=== jenkins down ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.jenkins.yml down
