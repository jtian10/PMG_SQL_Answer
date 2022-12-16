#Q1: Get the sum of clicks
SELECT SUM(clicks) AS "Total clicks"
FROM marketing_data;

#Q2: Gather the sum of revenue by store_location from the store_revenue table​
SELECT SUM(revenue) AS 'Total Revenue by Store'
FROM store_revenue
GROUP BY store_location;

#Q3: Merge these two datasets so we can see impressions, clicks, and revenue together by date and geo. 
SELECT m.date,geo,impressions,clicks,revenue 
FROM marketing_data m 
LEFT JOIN store_revenue s
ON s.date = m.date AND RIGHT(s.store_location, 2) = m.geo
ORDER BY m.date ASC,geo;

#Q4: In your opinion, what is the most efficient store and why? ​
# In my opinion, I think the most efficient store is the store located in CA with brand_id 2 because the store had the highest revenue among all of the stores.
# This store also has the 5th highest impression score in all stores with only a limited amount of clicks the store is performing extremely well. 



#Q5:(Challenge) Generate a query to rank in order the top 10 revenue producing states.
SELECT store_location,SUM(revenue),
RANK()OVER(ORDER BY sum(revenue) DESC )  AS 'Top10 Revenue' 
FROM store_revenue
GROUP BY store_location
ORDER BY SUM(revenue) DESC 
LIMIT 10;