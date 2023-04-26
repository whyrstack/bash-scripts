#!/bin/bash
#
# set colors Red Bold, Green Bold, No Color
RB='\033[1;31m'
GB='\033[1;32m'
NC='\033[0m'

# Service X
#
SERVICE_NAME="SERVICE_NAME"
SERVICE_NAME_IPS=(
        8.8.8.8
        1.1.1.1
)
SERVICE_NAME_PORTS=(
        53
        80
)

for IP in "${SERVICE_NAME_IPS[@]}"; do
        for PORT in "${SERVICE_NAME_PORTS[@]}"; do
                RESPONSE=$(timeout 1 telnet -c $IP $PORT 2>&1 | grep "\bConnected\b" | awk '{ print $1 }')
                if [[ $RESPONSE == *"Connected"* ]]; then
                        echo -e "${GB} $SERVICE_NAME connected to $IP on port $PORT ${NC}"
                else
                        echo -e "${RB} $SERVICE_NAME not connected to $IP on port $PORT ${NC}"
                fi
        done
done
