#TODO: paths must be taken from variable or something
#java -jar /opt/Synopsys/Defensics/monitor/boot.jar --set-license-flex-addr @100.66.228.229
#java -jar /opt/Synopsys/Defensics/monitor/boot.jar --suite /home/jukka/synopsys/defensics/suites/web-app-3.6.0/testtool/web-app-360.jar --sequence /home/jukka/Jenkinsstuff/jenkinstesting/environment/defensics/sequence/mutillidaefuzz.seq --index 1-300

#$1 = boot.jar path
#$2 = suite path
#$3 = sequencefile path

java -jar $1 --set-license-flex-addr @100.66.228.229
java -jar $1 --suite $2 --sequence $3 --index 1-300
