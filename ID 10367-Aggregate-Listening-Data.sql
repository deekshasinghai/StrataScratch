--You're tasked with analyzing a Spotify-like dataset that captures user listening habits.
--For each user, calculate the total listening time and the count of unique songs they've listened to.
--In the database duration values are displayed in seconds. Round the total listening duration to the nearest whole minute.
--The output should contain three columns: 'user_id', 'total_listen_duration', and 'unique_song_count'.

Query:
select user_id, count(distinct song_id) as unique_song_count, round (sum(listen_duration/60))
as total_listen_duration
from listening_habits
group by user_id;
