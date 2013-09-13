#!/bin/bash

xe host-set-hostname-live host-name=$(hostname | tr '[A-Z]' '[a-z]') host-uuid=$(xe host-list | grep -B1 $(hostname) | head -1 | cut -d: -f2 | sed 's/ //g')
xe host-param-set uuid=$(xe host-list | grep -B1 $(hostname | tr '[a-z]' '[A-Z]') | head -1 | cut -d: -f2 | sed 's/ //g') name-label=$(hostname | tr '[A-Z]' '[a-z]')
