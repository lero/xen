#!/bin/bash

# configure LACP on bond
for x in STORAGE PRODUCTION; do
    IFS=","
    for pif in $(xe pif-list network-name-label=BOND-$x params=uuid --minimal); do 
        xe pif-param-set other-config:bond-mode=lacp other-config:bond-hashing-algorithm=tcpudp_ports uuid=$pif
    done
done

# set MTU to 9000
for x in eth2 eth3; do
    IFS="," 
    for pif in $(xe pif-list network-name-label=Pool-wide\ network\ associated\ with\ $x params=uuid --minimal); do 
        xe pif-param-set uuid=$pif other-config:mtu=9000
    done
done

# set MTU to 9000
for x in eth6 eth7; do
    for pif in $(xe pif-list host-name-label=$(hostname) network-name-label=Pool-wide\ network\ associated\ with\ $x params=uuid --minimal); do 
        xe pif-param-set uuid=$pif other-config:mtu=9000
    done
done

IFS=","
for pif in $(xe pif-list network-name-label=BOND-STORAGE params=uuid --minimal); do
    xe pif-param-list uuid=$pif | grep other
done
