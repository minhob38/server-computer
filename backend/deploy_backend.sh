CURDIR=`dirname $0`

docker-compose -f $CURDIR/docker-compose.backend.yml pull

docker-compose -p server_a -f $CURDIR/docker-compose.backend.yml down
echo "server a down"
docker-compose -p server_a -f $CURDIR/docker-compose.backend.yml up -d
echo "server a up"

sleep 15

docker-compose -p server_b -f $CURDIR/docker-compose.backend.yml down
echo "server b down"
docker-compose -p server_b -f $CURDIR/docker-compose.backend.yml up -d
echo "server b up"

# 무중단 배포를 확인하기 위해서, 서버를 하나 down 하고 up 하지 않기