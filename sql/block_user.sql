INSERT INTO blocks
SELECT 'blocker username' , 'blocked account username'
WHERE NOT EXISTS(SELECT *
FROM blocks
WHERE blocker_username = 'follower username' AND  blocked_username = 'blocked account username'
)
