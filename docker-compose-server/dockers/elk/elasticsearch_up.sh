echo "=== elasticsearch up ==="

CURDIR=`dirname $0`
sudo docker-compose -f $CURDIR/docker-compose.elk.yml up -d


#     http.host: "0.0.0.0"
# xpack.monitoring.elasticsearch.hosts: [ "http://elasticsearch:9200" ]

# ## X-Pack security credentials
# xpack.monitoring.enabled: true
# xpack.monitoring.elasticsearch.username: elastic
# xpack.monitoring.elasticsearch.password: changeme!!!
# pip line
# input {
#   tcp {
#     port => 5000
#     codec => json
#   }
# }

# output {
# 	elasticsearch {
# 		hosts => "elasticsearch:9200"
# 		user => "elastic"
# 		password => "changeme!!!"
# 	}
# }