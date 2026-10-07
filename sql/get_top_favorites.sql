SELECT sender_username , content , sending_date , count(liker_username) AS likes
FROM favorite JOIN tweet ON favorite.favorite_tweet_id = tweet.tweet_id
WHERE sender_username NOT IN (SELECT blocker_username FROM blocks WHERE blocked_username = 'your username')
GROUP BY tweet_id
ORDER BY likes DESC