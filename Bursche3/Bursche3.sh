#! /bin/bash

for i in "$@"
do
case $i in
    -ip=*)
    myIP="${i#*=}"
    shift # past argument=value
    ;;
    -w=*)
    myWait="${i#*=}"
    shift # past argument=value
    ;;
esac
done

#echo "IP   = ${myIP}"
#echo "Wait = ${myWait}"


while true; do

	ping ${myIP} -c 1 > /dev/null
	if [ $? -eq 0 ]; then
		echo `date '+%Y-%m-%d %H:%M:%S'`" - ping auf ${myIP} => ok..."
	else 
		echo `date '+%Y-%m-%d %H:%M:%S'`" - ping auf ${myIP} => nicht ok..."
	fi      
	sleep ${myWait};

done           