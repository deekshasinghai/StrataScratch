-- You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans. 
--There is only one user named Karl and one named Hans in the dataset.
--The output should contain 'user_id' and 'user_name' columns.



Query:
with user_ids as (select user_id , user_name
from  users
where user_name in ('Karl', 'Hans')),

Friends AS ( SELECT u.user_id AS friend_user_id, u.user_name, f.user_id AS original_user_id
    FROM friends f
    JOIN users u ON f.friend_id = u.user_id
    JOIN user_ids ui ON f.user_id = ui.user_id)
    , KarlFriends AS (
    SELECT friend_user_id, user_name
    FROM Friends
    WHERE original_user_id = (SELECT user_id FROM user_ids WHERE user_name = 'Karl'))
,
    HansFriends AS (
    SELECT friend_user_id, user_name
    FROM Friends
    WHERE original_user_id = (SELECT user_id FROM user_ids WHERE user_name = 'Hans')
)
SELECT kf.friend_user_id AS user_id, kf.user_name
FROM KarlFriends kf
JOIN HansFriends hf ON kf.friend_user_id = hf.friend_user_id;
