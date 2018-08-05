#!/bin/bash

NODESIZE=t2.medium
NODECOUNT=5
ZONES=$(terraform output -json aws_zones | jq -r '.value|join(",")')
DNSZONE="$(terraform output k8s_zone_id)"
export KOPS_CLUSTER_NAME="ha.$(terraform output k8s_domain)"
export KOPS_STATE_STORE="s3://$(terraform output k8s_state)"

# install kops, kubectl 
if [ `which kops`x == 'x' ]; then
    brew install kops
fi

if [ `which kubectl`x == 'x' ]; then
    if [ `which go`x == 'x' ]; then
        brew install go
    fi
    brew install kubectl-cli
fi

# main

kops create cluster \
    --cloud aws \
    --master-zones $ZONES \
    --zones $ZONES \
    --node-count $NODECOUNT \
    --node-size $NODESIZE \
    --topology public \
    --dns-zone $DNSZONE \
    --dns public \
    --networking calico

