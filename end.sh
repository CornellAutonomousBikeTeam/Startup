rosnode kill -a
echo Press any key to continue...
read
BIKEPATH=$(rospack find bike)/bagfiles
TIME1=$(date +"%F")
TIME2=$(date +"%F~~%I-%M-%S-%p")
mv $BIKEPATH/$TIME1.bag  $BIKEPATH/$TIME2.bag
echo Generating CSV files at *_$TIME2.csv...
rostopic echo -b $BIKEPATH/$TIME2.bag -p /bike_state > $BIKEPATH/bike_$TIME2.csv
rostopic echo -b $BIKEPATH/$TIME2.bag -p /gps > $BIKEPATH/gps_$TIME2.csv
rostopic echo -b $BIKEPATH/$TIME2.bag -p /nav_instr > $BIKEPATH/nav_instr_$TIME2.csv
rostopic echo -b $BIKEPATH/$TIME2.bag -p /paths > $BIKEPATH/paths_$TIME2.csv
rostopic echo -b $BIKEPATH/$TIME2.bag -p /pid > $BIKEPATH/pid_$TIME2.csv
rostopic echo -b $BIKEPATH/$TIME2.bag -p /kalman_pub > $BIKEPATH/kalman_pub_$TIME2.csv
echo The file was saved at $BIKEPATH/$TIME2.csv
killall -9 rosmaster
killall -9 roscore	
