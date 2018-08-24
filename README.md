# AlwaysOnStreaming
The project aims to build an real-time Tweets processing pipeline on Kubernetes provisioned on AWS using Terraform.
[Slides](https://docs.google.com/presentation/d/1jD1VXUch3qiPvovhpaFjI7tyZJsINTLLmT_nyfCSuGw/edit#slide=id.g402cc7d31f_0_124)
## Why am I doing this?
In 2012 when storm Sandy arrived, flood related tweets (blue line) went up by 3 times and lasted till the storm started to dissipate. This peak-valley pattern could potentially cause pressure to the real-time data processing pipeline. More servers are needed to process more data in peak hours. But manually adding servers could be error-prone and less efficient. On the other side, maintaining backup servers all the time is also unrealistic and less cost-effective. 
## Data
Historic Twitter data as a stream (python client Kafka producer)
## Pipeline
![scheme](https://github.com/liouvetren/alwaysonstreaming/blob/master/resources/scheme.png)
## Monitoring
[interactive](https://snapshot.raintank.io/dashboard/snapshot/OvCrlCYs9WzgyCUraRJaQuZB17qox72d?orgId=2)
![monitoring](https://github.com/liouvetren/alwaysonstreaming/blob/master/resources/monitor.png)
