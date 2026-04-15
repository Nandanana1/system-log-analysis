# System Log Analysis using SQL

## Project Description
This project analyzes system log data to identify errors, warnings, and performance issues using SQL. It simulates real-world application support scenarios.

---
## Database Structure

**Table: logs**
- log_id – Unique ID  
- log_time – Date and time of log  
- log_level – ERROR, WARNING, INFO  
- message – Log message  
- service_name – Service name  

---

##Key SQL Queries

###1. Errors by Service

SELECT service_name, COUNT(*) AS error_count
FROM logs
WHERE log_level = 'ERROR'
GROUP BY service_name;
------------------------------------
###2. Most Frequent Error

SELECT message, COUNT(*) AS total
FROM logs
WHERE log_level = 'ERROR'
GROUP BY message
ORDER BY total DESC;
------------------------------------
###3. Logs by Level

SELECT log_level, COUNT(*) AS count
FROM logs
GROUP BY log_level;
------------------------------------
-->>> Insights
PaymentService has the highest number of errors
Most errors occur during peak hours
Database connection issues are frequent

-->>>Possible Causes
High error rate due to server overload
Timeout errors caused by network issues

-->>>Suggested Improvements
Improve server performance
Add better error handling
Monitor logs regularly


-->>>Tools Used
 >SQL
 >GitHub 
--Suggested Improvements
Improve server performance
Add better error handling
Monitor logs regularly
