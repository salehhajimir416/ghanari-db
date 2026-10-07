INSERT INTO hashtag
VALUES('#abcde');


INSERT INTO hashtag_tweets
SELECT hashtag_content , 'id of tweet'
FROM hashtag
WHERE hashtag_content REGEXP '#[a-z][a-z][a-z][a-z][a-z]' AND hashtag_content = 'content'