#!/bin/bash

export KOPS_CLUSTER_NAME="ha.$(terraform output k8s_domain)"
export KOPS_STATE_STORE="s3://$(terraform output k8s_state)"
FOLDER=tf

# main

if [ $1 == "create" ]; then # create S3 state and terraform configuration
    # default: 
    MASTERSIZE=t2.xlarge
    MASTERVOLUME=100 # in GB
    NODESIZE=t2.xlarge
    NODECOUNT=5
    NODEVOLUME=100 # in GB
    ZONES=$(terraform output -json aws_zones | jq -r '.value|join(",")')
    DNSZONE="$(terraform output k8s_zone_id)"
    kops create cluster \
        --cloud aws \
        --master-zones $ZONES \
        --master-size $MASTERSIZE \
        --master-volume-size $MASTERVOLUME \
        --zones $ZONES \
        --node-count $NODECOUNT \
        --node-size $NODESIZE \
        --node-volume-size $NODEVOLUME \
        --topology private \
        --dns-zone $DNSZONE \
        --dns public \
        --authorization RBAC \
        --networking kopeio-vxlan \
        --target terraform \
        --out $FOLDER
    echo "----------------------------------"
    echo "Create Cluster:" 
    echo "$KOPS_CLUSTER_NAME"
    echo "Master at zones: $ZONES"
    echo "Nodes: $NODESIZE : $NODECOUNT"
    echo "Usage: $0 update"
    echo "----------------------------------"

elif [ $1 == "edit" ]; then # edit and update S3 state, terraform
    kops edit cluster
    kops update cluster --target terraform --out $FOLDER
    echo "----------------------------------"
    echo "Edit Cluster: (changes made to terraform)"
    echo "$KOPS_CLUSTER_NAME"
    echo "Usage: $0 update"
    echo "----------------------------------"

elif [ $1 == "update" ]; then # match resources with S3 (may change terraform)
    kops update cluster --target terraform --out $FOLDER --yes
    kops update cluster --yes

elif [ $1 == "delete" ]; then # delete resources, S3 state, terraform
    kops delete cluster --yes
    rm -rf $FOLDER

else
    echo "Usage: $0 create/edit/update/delete"
fi 