CREATE DATABASE log_analysis;
USE log_analysis;
CREATE TABLE logs (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    log_time DATETIME,
    log_level VARCHAR(10),
    message VARCHAR(255),
    service_name VARCHAR(50)
);
INSERT INTO logs (log_time, log_level, message, service_name) VALUES
('2026-04-01 10:00:00', 'ERROR', 'Database connection failed', 'AuthService'),
('2026-04-01 10:05:00', 'INFO', 'User login successful', 'AuthService'),
('2026-04-01 10:10:00', 'WARNING', 'High memory usage', 'PaymentService'),
('2026-04-01 10:15:00', 'ERROR', 'Payment failed', 'PaymentService'),
('2026-04-01 10:20:00', 'INFO', 'Order placed', 'OrderService'),
('2026-04-01 10:25:00', 'ERROR', 'Timeout error', 'OrderService');

/* Count logs by level */

SELECT log_level, COUNT(*) AS total
FROM logs
GROUP BY log_level;

/* Find all errors */

SELECT * FROM logs
WHERE log_level = 'ERROR';

/*Most frequent error*/

SELECT message, COUNT(*) AS count
FROM logs
WHERE log_level = 'ERROR'
GROUP BY message
ORDER BY count DESC;

/*Error by service*/

SELECT service_name, COUNT(*) AS error_count
FROM logs
WHERE log_level = 'ERROR'
GROUP BY service_name;

/*Detect peak error time*/

SELECT DATEPART(HOUR, log_time) AS hour, COUNT(*) AS error_count
FROM logs
WHERE log_level = 'ERROR'
GROUP BY DATEPART(HOUR, log_time)
ORDER BY error_count DESC;
