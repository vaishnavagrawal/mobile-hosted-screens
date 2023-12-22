
echo "Started the script on ec2"
echo "target path $1"
echo "target port $2"

cd $1
kill -9 $(sudo lsof -t -i:$2)
http-server -p $2

