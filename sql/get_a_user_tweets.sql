SELECT content
FROM tweet
WHERE sender_username = 'sender username' AND NOT EXISTS
	(SELECT *
	 FROM blocks
	 WHERE blocker_username = 'sender username' AND blocked_username = 'your username'
	)
