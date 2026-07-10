create database bpo_miss;
USE `bpo-operations-mis-dashboard`;
SHOW TABLES;

SELECT * FROM call_center LIMIT 10;


SHOW COLUMNS FROM call_center;


select COUNT(`Call Id`) as Total_call from call_center;


Select COUNT(*) as Answered_calls from call_center where `Answered (Y/N)` ='Y';


Select COUNT(*) as Unanswered_calls from call_center where `Answered (Y/N)` ='N';


SELECT ROUND(
       SUM(CASE
             WHEN `Answered (Y/N)`='Y'
             THEN 1
             ELSE 0
           END)
/COUNT(*)*100,2) AS Answer_Rate
FROM call_center;


SELECT ROUND(
SUM(CASE
WHEN Resolved='Y'
THEN 1
ELSE 0
END)
/SUM(CASE
WHEN `Answered (Y/N)`='Y'
THEN 1
ELSE 0
END)*100,2) AS Resolution_Rate
FROM call_center;


SELECT ROUND(AVG(`Speed of Answer`),2) AS Avg_Speed_Of_Answer
FROM call_center;


SELECT `AvgTalkDuration`
FROM call_center
LIMIT 10;


SELECT ROUND(AVG(`Satisfaction rating`),2) AS Avg_CSAT
FROM call_center;


SELECT
Agent,
COUNT(*) AS Total_Calls
FROM call_center
GROUP BY Agent
ORDER BY Total_Calls DESC;


SELECT
Department,
COUNT(*) AS Total_Calls
FROM call_center
GROUP BY Department;


SELECT Agent,
COUNT(*) AS Total_Calls,
SUM(CASE WHEN `Answered (Y/N)`='Y' THEN 1 ELSE 0 END) AS Answered,
SUM(CASE WHEN Resolved='Y' THEN 1 ELSE 0 END) AS Resolved,
ROUND(AVG(`Speed of answer`),2) AS Avg_Answer_Time,
ROUND(AVG(`Satisfaction rating`),2) AS Avg_CSAT
FROM call_center
GROUP BY Agent
ORDER BY Avg_CSAT DESC;


SELECT
Department,
COUNT(*) AS Total_Calls,
ROUND(AVG(`Speed of answer`),2) AS Avg_Answer_Time,
ROUND(AVG(`Satisfaction rating`),2) AS Avg_CSAT
FROM call_center
GROUP BY Department;


SELECT
Date,
COUNT(*) AS Total_Calls
FROM call_center
GROUP BY Date
ORDER BY Date;