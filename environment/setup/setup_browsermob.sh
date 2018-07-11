#setup browsermob
echo "curl"
sleep 5
curl -X POST -d "port=8081" http://localhost:8181/proxy 
#There were some issues of proxy not working properly. Assumed it was due to these commands executing too fast.
sleep 1
echo "curl"
curl -X PUT -d "captureContent=true" -d "captureHeaders=true" -d "captureCookies=true" -d "captureBinaryContent=true" http://localhost:8181/proxy/8081/har 
sleep 1
echo "curl"
# Set mutillidae database. Silence output due to its huge size
curl -s http://localhost:81/mutillidae/set-up-database.php > /dev/null
sleep 1

