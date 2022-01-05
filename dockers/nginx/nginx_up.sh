echo "=== nginx up ==="

CURDIR=`dirname $0`
DIR="~/server-computer/server/nginx_config"

docker-compose -f $CURDIR/docker-compose.nginx.yml up -d \
&& docker cp $DIR/nginx.conf nginx:/etc/nginx/nginx.conf \
&& docker cp $DIR/default.conf nginx:/etc/nginx/conf.d/default.conf\
&& docker exec -it nginx service nginx reload
