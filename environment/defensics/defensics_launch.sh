#$1 is sequence file location
#$2 har file location
#$3 workspace
str=$3
targethost=localhost
# There might be a better way. 
bootjar=$(locate -i Defensics/monitor/boot.jar)
suite=$(locate -i /testtool/web-app-360.jar)
echo "LICENCE THINGS"
java -jar $bootjar --set-license-flex-addr @100.66.228.229
echo "SEQUENCE CREATION"
echo "CREATING SEQUENCE FROM HAR IN $2 TO $1 WITH THE TARGET HOST $targethost"
java -jar $bootjar --create-sequence $2 --save-sequence-path $1 --target-hosts $targethost
echo "TESTING"
java -jar $bootjar --verbose --suite $suite --sequence $1 --index 1-150 --report post-run --fail-report zip --pass-report zip || true
echo "RESULTS"
str=$3
str=${str%workspace/*}synopsys/defensics/results/Web-Application/
LATEST=$(ls -t $str | head -1) 
str=${str}$LATEST/summary.txt
cat $str
