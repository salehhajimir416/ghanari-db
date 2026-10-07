SELECT content , sending_date
FROM tweet 
WHERE sender_username = 'personal username'
ORDER BY tweet.sending_date DESC