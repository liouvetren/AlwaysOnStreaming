#!/bin/bash
ZONES=$(terraform output -json aws_zones | jq -r '.value|join(",")')
NAME="k8s.$(terraform output domain_name)"
DNSZONE="$(terraform output public_zone_id)"
STATE="$(terraform output k8s_state_store)"

if [ $1 == "create" ]; then

    kops create cluster \
    	--cloud aws \
        --master-zones $ZONES \
        --zones $ZONES \
        --node-count 5 \
        --node-size t2.medium \
        --topology private \
        --dns-zone $DNSZONE \
        --dns public \
        --networking calico \
        --state $STATE \
        --target=terraform \
        --out=./k8s \
        --name $NAME
elif [ $1 == "update" ]; then
    kops update cluster \
        --name  $NAME \
        --state $STATE \
        --yes
elif [ $1 == "delete" ]; then
    kops delete cluster \
        --name  $NAME \
        --state $STATE \
        --yes
elif [ $1 == "validate" ]; then
    kops validate cluster \
        --name  $NAME \
        --state $STATE 
else
    echo "Usage: $0 create/update/delete"
fi

