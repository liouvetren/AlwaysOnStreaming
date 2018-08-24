# AlwaysOnStreaming
The project aims to build an real-time Tweets processing pipeline on Kubernetes provisioned on AWS using Terraform.
[Slides](https://docs.google.com/presentation/d/1jD1VXUch3qiPvovhpaFjI7tyZJsINTLLmT_nyfCSuGw/edit#slide=id.g402cc7d31f_0_124)
## Why am I doing this?
Company grows, day/night data volume change
## Data
Historic twitter data as a stream (python client Kafka producer)
## Pipeline
![scheme](https://github.com/liouvetren/alwaysonstreaming/blob/master/resources/scheme.png)
## Monitoring
[interactive](https://snapshot.raintank.io/dashboard/snapshot/OvCrlCYs9WzgyCUraRJaQuZB17qox72d?orgId=2)
![monitoring](https://github.com/liouvetren/alwaysonstreaming/blob/master/resources/monitor.png)
