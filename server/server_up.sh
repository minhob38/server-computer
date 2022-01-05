if [ ! -d ~/express-server ]; then
    echo "clone" && git clone https://github.com/minhob38/express-server.git ~/express-server;
fi

if [ -d ~/express-server ]; then
    echo "pull" && cd ~/express-server && git pull origin master; 
fi

cd ~/express-server
npm run docker:compose-up