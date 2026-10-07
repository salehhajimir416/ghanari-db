select c.sender_username , c.content , c.sending_date
FROM (SELECT *
FROM tweet 
WHERE sender_username NOT IN (
SELECT blocker_username
FROM blocks
WHERE blocked_username = 'your username'
) ) AS  c
WHERE c.tweet_mention_id = 'id' 






