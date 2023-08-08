# How to Get Started with Stream Processing, Kafka and SQL
- Event Name: Software Developer Days Istanbul 2023
- Date: August 12-13, 2023
- Venue: IPA Florya Campus
- Address: Basınköy, Valilik Yolu Cd. No:2, 34153 Bakırköy / Istanbul
- Duration: 1 hour
- Target audience: Java/SQL application developers and solution architects.
- Prerequisites: Familiarity with Java, Kafka and SQL.
- Lab Leads: Fawaz Ghali, PhD and Hazelcast engineers.


## Description: 
In this hands-on workshop, you will gain an understanding of how to use Hazelcast to build solutions that react to events in real-time. Participants will have the end-to-end experience of developing a solution on their laptop. We will cover the basic elements of a Pipeline: sources, sinks, map (variants such as usingService, usingIMap), aggregations, filters.

Participants will be guided through the development of a basic Pipeline that contains all of the essential elements of a stream processing solution, including sources, sinks, mappings, aggregations, and filters. Attendees will learn how to use Hazelcast, Kafka and SQL to process streaming data; enrich streaming data with data in fast storage; store output in fast storage.

## Prerequisites
- Download Hazelcast: https://docs.hazelcast.com/hazelcast/latest/getting-started/get-started-cli
- Download Kafka: https://kafka.apache.org/downloads

## SQL queries
### Run ```create_stream.sql```
```
SELECT customer AS Customer, ROUND(price,2) AS Price, amount AS "Sold"
FROM orders;
```

Limit the output to one item.
```
SELECT customer AS Customer, ROUND(price,2) AS Price, amount AS "Sold"
FROM orders
WHERE customer = 'Fawaz';
```
Or
```
SELECT customer AS Customer, ROUND(price,2), amount AS "Sold"
FROM orders
WHERE customer = 'Jon' AND amount > 50;
```

### Run ```enrich.sql```

```
INSERT INTO extras VALUES
(1, 'Fawaz', 'blue','red','green'),
(2, 'Jon', 'green', 'blue', 'blue'),
(3, 'Mike', 'blue','green', 'blue'),
(4, 'Mark', 'blue','blue', 'blue'),
(5, 'Dale', 'blue', 'red', 'green'),
(6, 'Chiara', 'blue', 'red', 'blue'),
(7, 'Martin', 'green', 'red', 'blue'),
(8, 'Denis', 'green', 'red', 'blue'),
(9, 'Johnson', 'blue','green','red');
```
### Check results
```
SELECT
    orders.customer AS Symbol,
    extras.extra1 as extra1,
    extras.extra2 as extra2,
    extras.extra3 as extra3,
     ROUND(orders.price,2) AS Price,
     orders.amount AS "Sold"
FROM orders
JOIN extras
ON extras.customer = orders.customer 
AND extras.extra2 = 'red';
```
## Slack
Make sure to joing our Community Slack: https://slack.hazelcast.com/
