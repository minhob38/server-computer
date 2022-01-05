SERVER="server"

if [ ! -d ~/${SERVER} ]; then
    echo "clone" && git clone https://github.com/minhob38/express-server.git ~/${SERVER};
fi

if [ -d ~/${SERVER} ]; then
    echo "pull" && cd ~/${SERVER} && git pull origin master;
fi

docker-compose-up -p server_a -f ~/${SERVER}/docker-compose.yml up -d
docker-compose-up -p server_b -f ~/${SERVER}/docker-compose.yml up -d
