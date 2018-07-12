#Change paths to correspond your own patchs
#java -jar /opt/Synopsys/Defensics/monitor/boot.jar --suite /home/jukka/synopsys/defensics/suites/web-app-3.6.0/testtool/web-app-360.jar --sequence mutillidaefuzz.seq --index 1-300
java -jar /opt/Synopsys/Defensics/monitor/boot.jar --set-license-flex-addr @100.66.228.229
java -jar /opt/Synopsys/Defensics/monitor/boot.jar --suite /home/jukka/synopsys/defensics/suites/web-app-3.6.0/testtool/web-app-360.jar --sequence /home/jukka/Jenkinsstuff/jenkinstesting/environment/defensics/sequence/mutillidaefuzz.seq --index 1-300
