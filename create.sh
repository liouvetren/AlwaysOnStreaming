#!/bin/bash

# spin up k8s cluster
cd k8s
terraform apply 
./kops_terraform.sh create
./kops_terraform.sh update
cd ..

# add-on 
kubectl create -f k8s_addon/kubernetes-dashboard.yaml
kubectl create -f k8s_addon/tiller-rbac.yaml
helm init --service-account tiller

# prometheus-operator
helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace monitoring
# kubectl port-forward $(kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000

# incubator/kafka (kafka_2.11-1.1.1-cp1.jar)
helm install incubator/zookeeper --name kafka --namespace kafka -f incubator_kafka/zookeeper_values.yaml
helm install incubator/kafka --name kafka --namespace kafka -f incubator_kafka/kafka_values.yaml
kubectl create -f kafkaclient.yaml
kubectl -n kafka exec kafkaclient -- /usr/bin/kafka-topics --zookeeper zookeeper.kafka:2181 --topic twitterdata --create --partitions 8 --replication-factor 1

# spark-operator ((2.4.0-SNAPSHOT))
kubectl create -f spark-on-k8s-operator/manifest/spark-operator-rbac.yaml
kubectl create -f spark-on-k8s-operator/manifest/spark-operator-with-metrics.yaml
kubectl create -f spark-on-k8s-operator/manifest/spark-rbac.yaml

# cassandra 
helm install incubator/cassandra --name cassandra --namespace database -f incubator_cassandra/cassandra_values.yaml 

# stream 
kubectl create namespace stream
kubectl create secret generic s3-pass --from-literal=accesskey=$AWS_ACCESS_KEY_ID --from-literal=secretkey=$AWS_SECRET_ACCESS_KEY --namespace stream # S3 access secret
