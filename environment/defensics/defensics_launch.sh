#$1 is sequence file location
#$2 har file location

# There might be a better way. 
bootjar=$(locate -i Defensics/monitor/boot.jar)
suite=$(locate -i /testtool/web-app-360.jar)

java -jar $bootjar --set-license-flex-addr @100.66.228.229
java -jar $bootjar --create-sequence $2 --save-sequence-path $1 --target-hosts localhost
java -jar $bootjar --verbose --suite $suite --sequence $1 --index 1-300 || true
