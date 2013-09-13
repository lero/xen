#!/bin/bash

xe network-create name-label=DEDICATED_VLAN137
xe pool-vlan-create vlan=137 network-uuid=$(xe network-list name-label=DEDICATED_VLAN137 params=uuid --minimal) pif-uuid=$(xe pif-list network-name-label=BOND-PRODUCTION --minimal |awk -F, '{print $1}')
xe network-param-set other-config:automatic=false uuid=$(xe network-list name-label=DEDICATED_VLAN137 params=uuid --minimal)
