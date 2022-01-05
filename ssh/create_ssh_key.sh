CURDIR=`dirname $0`

# ssh key 생성 (shh client)
ssh-keygen -t rsa -f $CURDIR/keys/key -C minho

# public key 전송
# scp -P [remote server port] $CURDIR/keys/key [remote server id]@$[remote server ip]:~./
