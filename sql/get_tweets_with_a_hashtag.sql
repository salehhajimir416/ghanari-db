SELECT ava.sender_username , ava.content , ava.sending_date
FROM tweet AS ava JOIN hashtag_tweets AS ht ON ht.corresponding_tweet_id = ava.tweet_id
WHERE ht.content = 'content' AND NOT EXISTS(
SELECT *
FROM blocks
WHERE blocker_username = ava.sender_username AND blocked_username = 'your username'
)
ORDER BY ava.sending_date DESC