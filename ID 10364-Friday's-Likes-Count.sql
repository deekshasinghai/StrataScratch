--You have access to Facebook's database which includes several tables relevant to user interactions.
--For this task, you are particularly interested in tables that store data about user posts, friendships, and likes. 
--Calculate the total number of likes made on friend posts on Friday.
--The output should contain two different columns 'likes' and 'date'.

Query:
with temp as (SELECT *,DAYNAME(date_liked) as day_name
FROM likes)
select  date_liked , count(date_liked) as likes from temp t join
friendships f on t.user_name = f.user_name2
where day_name ='Friday'
group by user_name , post_id
