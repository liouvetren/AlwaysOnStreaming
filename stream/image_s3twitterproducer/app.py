#!/usr/bin/env python3
from datetime import datetime, timedelta
from confluent_kafka import Producer
from smart_open import smart_open
import sys
import os 
from time import time
from math import sin, pi
from random import random
import json

# s3://data-pool-liouvetren 2017/12/22/00/00 2017/12/22/00/01 localhost:9092 twitterdata

# Twitter Producer from range of (start_time, end_time)
class TwitterProducer(object):

	def __init__(self, s3_url, bootstrap_servers):
		self.s3_url = s3_url
		self.producer = Producer({
			'bootstrap.servers': bootstrap_servers})

	def produce(self, topic, start_time, end_time):
		st = datetime.strptime(start_time,"%Y/%m/%d/%H/%M")
		ed = datetime.strptime(end_time,"%Y/%m/%d/%H/%M")
		dt = timedelta(minutes=1) 
		
		while st < ed:
			num = 0
			producer_start = time()
			with smart_open( self.s3_url + '/' 
				+ st.strftime('%Y/%m/%d/%H/%M.json'),'r' ) as f:
				self.producer.flush()
				for message in f:
					self.producer.produce(topic, value=message)
					num += 1
					sleeptime = 0.01*(1 + sin(time()*pi/30.)) + random() * 0.002
					time.sleep(sleeptime)
			st += dt
			print ( "%f time passed" % (time()-producer_start,) )
			print ( "%d messages sent" % (num,) )


if __name__ == "__main__":

	if len(sys.argv) != 6:
		print ("Usage: %s start_time end_time bootstrap_servers topic"%(sys.argv[0],))
		exit(1)

	s3_url				 = sys.argv[1]
	start_time, end_time = sys.argv[2], sys.argv[3]
	bootstrap_servers	 = sys.argv[4]
	topic 				 = sys.argv[5]

	producer = TwitterProducer(s3_url, bootstrap_servers)
	producer.produce(topic, start_time, end_time)

	
