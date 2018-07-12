#$1 = boot.jar path
#$2 = suite path
#$3 = sequencefile path
java -jar $1 --set-license-flex-addr @100.66.228.229
java -jar $1 --suite $2 --sequence $3 --index 1-300
