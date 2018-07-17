#$1 is sequence file location
# There might be a better way. 
bootjar=$(locate -i Defensics/monitor/boot.jar)
suite=$(locate -i /testtool/web-app-360.jar)

java -jar $bootjar --set-license-flex-addr @100.66.228.229
java -jar $bootjar --suite $suite --sequence $1 || true
