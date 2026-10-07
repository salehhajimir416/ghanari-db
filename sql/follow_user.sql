INSERT INTO follow
SELECT 'follower username' , 'following username'
WHERE NOT EXISTS(SELECT *
FROM follow
WHERE follower_username = 'follower username' AND  following_username = 'following username'
)






