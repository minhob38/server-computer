echo "=== elasticsearch up ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.elk.yml up -d

