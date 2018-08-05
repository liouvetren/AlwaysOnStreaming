$SPARKHOME/bin/spark-submit \
--master k8s://https://api.ha.k8s.liouvetren.com \
--deploy-mode cluster \
--name spark-pi \
--class org.apache.spark.examples.SparkPi \
--conf spark.executor.instances=3 \
--conf spark.kubernetes.container.image=docker.io/liouvetren/spark:v2.3.0 \
--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-serviceaccount \
local:///opt/spark/examples/jars/spark-examples_2.11-2.3.0.jar