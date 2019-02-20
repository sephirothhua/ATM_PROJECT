update to python3 by hhn

This is a simple example to create a producer (producer.py) and a consumer (consumer.py) to stream Avro via Kafka

Install packets via PIP
```
pip install -r requirements.txt
```

Run consumer:
```
python  consumer.py
```

Run producer:
```
python producer.py
```

inorder to to send a large message,
change the following properties in 
server.properties:
```
message.max.bytes=15728640
replica.fetch.max.bytes=15728640
max.request.size=15728640
fetch.message.max.bytes=15728640
```


and producer.properties:
```
max.request.size=15728640
```



