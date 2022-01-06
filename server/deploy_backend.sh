CURDIR=`dirname $0`
SERVER1_PORT=`docker-compose -p server1 -f docker-compose.backend.yml ps | grep server1 | rev | cut -c 11-14 | rev`
SERVER2_PORT=`docker-compose -p server2 -f docker-compose.backend.yml ps | grep server2 | rev | cut -c 11-14 | rev`
echo "SERVER1_PORT: ${SERVER1_PORT}"
echo "SERVER2_PORT: ${SERVER2_PORT}"

NGINX_CONF=/etc/nginx/nginx.conf

docker-compose pull -f docker-compose.backend.yml \
&& docker exec -it nginx sed -i -e "s/:${SERVER1_PORT};/:${SERVER1_PORT} down;/gi" ${NGINX_CONF} \
&& echo "nginx upstream status" \
&& docker exec -it nginx grep ${SERVER1_PORT} ${NGINX_CONF} \
&& docker exec -it nginx grep ${SERVER2_PORT} ${NGINX_CONF} \
&& docker exec -it nginx service nginx reload \
&& docker-compose -p server1 -f docker-compose.backend.yml down \
&& docker-compose -p server1 -f docker-compose.backend.yml up -d \

sleep 15

docker exec -it nginx sed -i -e "s/:${SERVER1_PORT} down;/:${SERVER1_PORT};/gi" ${NGINX_CONF} \
&& docker exec -it nginx sed -i -e "s/:${SERVER2_PORT};/:${SERVER2_PORT} down;/gi" ${NGINX_CONF} \
&& echo "nginx upstream status" \
&& docker exec -it nginx grep ${SERVER1_PORT} ${NGINX_CONF} \
&& docker exec -it nginx grep ${SERVER2_PORT} ${NGINX_CONF} \
&& docker exec -it nginx service nginx reload \
&& docker-compose -p server2 -f docker-compose.backend.yml down \
&& docker-compose -p server2 -f docker-compose.backend.yml up -d \

sleep 15

docker exec -it nginx sed -i -e "s/:${SERVER2_PORT} down;/:${SERVER2_PORT};/gi" ${NGINX_CONF} \
&& echo "nginx upstream status" \
&& docker exec -it nginx grep ${SERVER1_PORT} ${NGINX_CONF} \
&& docker exec -it nginx grep ${SERVER2_PORT} ${NGINX_CONF} \
&& docker exec -it nginx service nginx reload
