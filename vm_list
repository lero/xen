#!/bin/bash

[ -z $1 ] && { echo -e "Use $0 \"Storage name-label\"\n $0 NFS-0001"
             exit 1
}

for i in $(xe sr-list name-label=$1 params=VDIs --minimal |sed 's/;/\n/g'); do
    vbd=$(xe vdi-list uuid=$i params=vbd-uuids --minimal)
    if [ ! -z $vbd ];then
        vm_uuid=$(xe vbd-list uuid=$vbd params=vm-uuid --minimal)
        vm=$(xe vm-list uuid=$vm_uuid params=name-label --minimal)
        if [ ! -z $vm ];then
            echo $vm
        fi
    fi
done
