SELECT sender_username , content
FROM tweet,follow
WHERE sender_username = following_username AND follower_username = 'your username' AND NOT EXISTS
	(SELECT *
	 FROM blocks
	 WHERE blocker_username = sender_username AND blocked_username = 'your username'
	)
ORDER BY sending_date DESC
