# ElasticSparkOnKubernetes
The project aims to build an autoscaling spark streaming cluster on Kunbernetes to provide a more granular resource management. A live dashboard will be built on this cluster to identify real-time toxic twitters.
## Why am I doing this?
As company grows, streaming data processing is 
## Data
Historic twitter data as a stream
## Pipeline

Standard kafka-spark-db-web set up.
DB is used for storing data for dashboard query.

## Monitoring
CPU usage, Process rate, Mem usage, Input Hz, throughput Hz, etc.

## WebUI (Dashboard)
Sentiment Analysis
Hot Hashtag
Toxic twitter Percentage 

## Backup Plan
Not enough data to max out Spark?
* Multiple dataset by 10
* Produce seudo twitter data
