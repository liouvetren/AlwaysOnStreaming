#!/bin/bash

# # spin up k8s cluster
# cd k8s
# terraform apply 
# ./kops_terraform.sh create
# # set kubeControllerManager: horizontalPodAutoscalerUseRestClients: true, using kops edit
# ./kops_terraform.sh update
# cd ..

# add-on 
kubectl create -f k8s_addon/kubernetes-dashboard.yaml
kubectl create -f k8s_addon/tiller-rbac.yaml
kubectl create -f k8s_addon/metrics-server.yaml
helm init --service-account tiller
helm install stable/metrics-server --namespace monitoring # required for HPA

# prometheus
helm install stable/prometheus --name prometheus --namespace monitoring -f prometheus_stable/prometheus_values.yaml
helm install stable/grafana --name grafana --namespace monitoring

# # prometheus-operator
# kubectl create -f coreos_prometheus/prometheus_rbac.yaml
# helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring -f coreos_prometheus/prometheus_operator_values.yaml


# incubator/kafka (kafka_2.11-1.1.1-cp1.jar)
helm install incubator/zookeeper --name kafka --namespace kafka -f incubator_kafka/zookeeper_values.yaml
echo "wait for zookeeper to spin up ..."
sleep 60
helm install incubator/kafka --name kafka --namespace kafka -f incubator_kafka/kafka_values.yaml
kubectl create -f incubator_kafka/kafkaclient.yaml

kubectl -n kafka exec kafkaclient -- /usr/bin/kafka-topics --zookeeper zookeeper.kafka:2181 --topic twitterdata --create --partitions 8 --replication-factor 1
kubectl -n kafka exec kafkaclient -- /usr/bin/kafka-topics --zookeeper zookeeper.kafka:2181 --alter --topic twitterdata --config retention.ms=600000

# cassandra 
helm install incubator/cassandra --name cassandra --namespace database -f incubator_cassandra/cassandra_values.yaml

# spark cluster
kubectl create -f spark_rbac.yaml
kubectl create -f spark_shuffle.yaml
kubectl create -f spark_shuffle.yaml



# stream 
kubectl create namespace stream
kubectl create secret generic s3-pass --from-literal=accesskey=$AWS_ACCESS_KEY_ID --from-literal=secretkey=$AWS_SECRET_ACCESS_KEY --namespace stream # S3 access secret
kubectl create -f namespace stream
kubectl create -f namespace stream 


$SPARK_HOME/bin/spark-submit \
  --deploy-mode cluster \
  --master k8s://https://kubernetes.default:443 \
  --kubernetes-namespace spark \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
  --conf spark.dynamicAllocation.enabled=true \
  --conf spark.dynamicAllocation.maxExecutors=6 \
  --conf spark.dynamicAllocation.executorIdleTimeout=5 \
  --conf spark.local.dir=/tmp/spark-local \
  --conf spark.shuffle.service.enabled=true \
  --conf spark.kubernetes.shuffle.namespace=spark \
  --conf spark.kubernetes.shuffle.labels="app=spark-shuffle-service,spark-version=2.2.0" \
  --conf spark.kubernetes.initcontainer.docker.image=kubespark/spark-init:v2.2.0-kubernetes-0.5.0 \
  --conf spark.kubernetes.driver.docker.image=kubespark/spark-driver:v2.2.0-kubernetes-0.5.0 \
  --conf spark.kubernetes.executor.docker.image=kubespark/spark-executor:v2.2.0-kubernetes-0.5.0 \
  --conf spark.kubernetes.executor.memoryOverhead=600 \
  --conf spark.app.name=sparkjob \
  --conf spark.driver.cores="1000m" \
  --conf spark.executor.memory="3g" \
  --conf spark.executor.cores=1 \
  --conf spark.kubernetes.driver.label="spark-driver" \
  --conf spark.kubernetes.executor.label="spark-executor" \
  --class KafkaSparkCassandra \
  https://github.com/liouvetren/KafkaSparkCassandra/raw/master/target/scala-2.11/kafka-spark-cassandra-wordcount_2.11.8-2.2.0_1.0.jar

