#!/bin/bash 
#For MacOS
#Resets MAC address of en0 [wifi] to bypass time limit at public hotspots.

printf "Current MAC address: "
ifconfig en0 | grep ether

#Including an argument creates reproducible pseudo-random number.
if [ "$#" = 0 ]
then RANDSEED=`openssl rand -hex 5`
else RANDSEED=$(echo $1|md5)
fi

#Leading x02 byte creates local unicast address.
RANDMAC=$(echo $RANDSEED|sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02:\1:\2:\3:\4:\5/')
printf "Random MAC address:     ether "
echo $RANDMAC

sudo ifconfig en0 ether $RANDMAC
sudo ifconfig en0 down
sudo ifconfig en0 up
printf "New MAC address: "
ifconfig en0 | grep ether
