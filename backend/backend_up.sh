CURDIR=`dirname $0`

docker-compose -p server_a -f $CURDIR/docker-compose.backend.yml up -d
docker-compose -p server_b -f $CURDIR/docker-compose.backend.yml up -d
