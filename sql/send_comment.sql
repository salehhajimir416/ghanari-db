INSERT INTO tweet(content , sender_username , sending_date , tweet_mention_id)
SELECT * FROM (SELECT 'content of comment' , 'commenter username' , current_date(), 'id') AS tmp
WHERE NOT EXISTS(
SELECT *
FROM blocks
WHERE blocker_username =  
	(
		SELECT t.sender_username
		FROM tweet AS t
		WHERE t.tweet_id = 'id'
	) 
AND blocked_username = 'commenter username'
)





