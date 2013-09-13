#!/bin/bash

sed -ie 's/dom0_mem=752M/dom0_mem=1024M/' /boot/extlinux.conf
. /etc/xensource-inventory
staticmax=`xe vm-param-get uuid=$CONTROL_DOMAIN_UUID param-name=memory-static-max`
echo staticmax=$staticmax
xe vm-param-set uuid=$CONTROL_DOMAIN_UUID memory-dynamic-max=$staticmax
xe vm-memory-target-set uuid=$CONTROL_DOMAIN_UUID target=$staticmax
