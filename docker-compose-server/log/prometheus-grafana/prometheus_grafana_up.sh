echo "=== prometheus / grafana up ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.prometheus-grafana.yml up -d
