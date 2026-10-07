INSERT INTO message(sender_username,receiver_username ,message_tweet_id,sending_time)
SELECT 'sender username','receiver username','id of tweet',NOW()
WHERE 'sender username' NOT IN (
	SELECT blocked_username 
	FROM blocks 
	WHERE blocker_username = 'receiver username')
AND 'sender username' NOT IN (
	SELECT blocked_username 
	FROM blocks 
	WHERE blocker_username = (
		SELECT sender_username 
		FROM tweet 
		WHERE tweet_id = 'id of tweet' )
)