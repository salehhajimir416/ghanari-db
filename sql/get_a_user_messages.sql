SELECT message.sender_username AS message_sender ,  tweet.sender_username AS tweet_sender , message.message_tweet_id AS id_tweet , message.content , message.sending_time
FROM message LEFT JOIN tweet ON message.message_tweet_id = tweet.tweet_id
WHERE tweet.sender_username NOT IN (
	SELECT blocked_username 
	FROM blocks
    WHERE blocker_username = 'tweet sender')
AND message.sender_username = 'message sender'
AND message.receiver_username = 'message receiver'

ORDER BY message.sending_time DESC











/*with blocked_by_user(user) as (select blocked from blocklists where blocker = 'mr.bin')
select message.sender as message_sender , voice.sender as voice_sender , voice_contained  , text, message.date 
from message left join voice on message.voice_contained = voice.id_voice
where #message.sender  not in  (select user from blocked_by_user)
	voice.sender not in (select user from blocked_by_user)
    and reciver = 'mr.bin'
    and message.sender = 'farzad80'
order by date desc*/