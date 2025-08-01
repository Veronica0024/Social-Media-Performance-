USE SocialmediaIT;

SELECT *
FROM posts;

-- “Which day and time block have the highest total engagement?”

SELECT  custom_label AS Time_Block , post_day,
	SUM(engagement_score) AS sip
FROM posts
GROUP BY  Time_Block, post_day
ORDER BY sip DESC;

-- Calculate the average engagement for each post type.

SELECT post_type, 
	AVG(engagement_score) AS Average_Engagement 
 FROM posts 
 GROUP BY post_type 
 ORDER BY Average_Engagement DESC;

-- Order platforms from best to worst based on engagement metrics.

SELECT platform , 
	AVG (engagement_score) AS Average_Engagement
FROM posts 
GROUP BY platform
ORDER BY Average_Engagement DESC;


-- Which sentiment category drives the most engagement? Facebook (THEN ALL)

SELECT platform , sentiment_score, 
	AVG (engagement_score) AS Average_Engagement
FROM posts 
WHERE platform = "Instagram"
GROUP BY platform, sentiment_score
ORDER BY Average_Engagement DESC;  -- Postive , Insta ; Negative, Twitter ; Neutral, Facebook 

-- GENERAL Sentiment 
SELECT sentiment_score, 
	AVG (engagement_score) AS Average_Engagement
FROM posts 
GROUP BY sentiment_score
ORDER BY Average_Engagement DESC; -- Leader os Negative 


-- What months have the highest average engagement per post?
SELECT month_name, 
       AVG(engagement_score) AS Average_Engagement
FROM posts 
GROUP BY month_name 
ORDER BY 
    CASE month_name
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- How many posts fall under each sentiment category per platform?

SELECT COUNT(sentiment_score) AS sip , platform , sentiment_score
FROM posts
GROUP BY platform, sentiment_score;








