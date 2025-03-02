-- What are the top five stories with the highest scores?
SELECT title, score
 FROM hacker_news
 ORDER By score DESC
 LIMIT 5;

-- Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).
-- Is this true of Hacker News?
-- Is a small percentage of Hacker News submitters taking the majority of the points?
-- First, find the total score of all the stories.
SELECT SUM(score)
 FROM hacker_news;

-- Next, we need to pinpoint the users who have accumulated a lot of points across their stories.
-- Find the individual users who have gotten combined scores of more than 200, and their combined scores.
SELECT user, SUM(score)
 FROM hacker_news
 GROUP BY user
 HAVING SUM(score) > 200;

-- Is Hacker News dominated by these users?
SELECT (309 + 304 + 282 + 517)/6366;
-- Four users are responsible for 22% of the points. 

-- Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.
-- The url of the video is: https://www.youtube.com/watch?v=dQw4w9WgXcQ
-- How many times has each offending user posted this link?
 SELECT user, COUNT(*)
 FROM hacker_news
 WHERE url like  '%watch?v=dQw4w9WgXcQ%'
 GROUP BY 1
 ORDER BY 2 DESC;

-- Hacker News stories are essentially links that take users to other websites.
-- Which of these sites feed Hacker News the most: GitHub, Medium, or New York Times?
SELECT CASE
  WHEN url LIKE '%github%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source', 
  COUNT(*)
FROM hacker_news
GROUP BY 1;

-- What’s the best time of the day to post a story on Hacker News?
-- Let’s write a query that returns three columns: (1) The hours of the timestamp, (2) The average score for each hour, and (3) The count of stories for each hour
SELECT strftime('%H', timestamp) AS hours, 
    ROUND(AVG(score)) AS average_score, 
    COUNT(*) AS number_stories
FROM hacker_news
GROUP BY 1;