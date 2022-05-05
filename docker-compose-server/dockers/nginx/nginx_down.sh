echo "=== nginx down ==="

CURDIR=`dirname $0`
docker-compose -f $CURDIR/docker-compose.nginx.yml down
