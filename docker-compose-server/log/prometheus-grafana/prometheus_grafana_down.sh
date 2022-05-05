echo "=== prometheus / grafana down ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.prometheus-grafana.yml down
