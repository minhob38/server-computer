echo "=== nginx up ==="

CURDIR=`dirname $0`
DIR="~/server-computer/dockers/nginx"

docker-compose -f $CURDIR/docker-compose.nginx.yml up -d \
&& docker cp $CURDIR/nginx.conf nginx:/etc/nginx/nginx.conf \
&& docker cp $CURDIR/default.conf nginx:/etc/nginx/conf.d/default.conf\
&& docker exec -it nginx nginx -s reload
