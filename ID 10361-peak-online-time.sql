--You are given a dataset from Amazon that tracks and aggregates user activity on their platform in certain time periods. 
--For each device type, find the time period with the highest number of active users.
--The output should contain 'user_count', 'time_period', and 'device_type', 
--where 'time_period' is a concatenation of 'start_timestamp' and 'end_timestamp', like ; "start_timestamp to end_timestamp".

Query:
select  user_count, concat(start_timestamp, ' to ', end_timestamp) time_period , device_type
from user_activity;
