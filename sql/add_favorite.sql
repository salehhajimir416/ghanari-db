insert into favorite (liker_username, favorite_tweet_id)
select 'jali', 5
where 'jali' not in (select blocked_username from blocks where blocker_username = (select sender_username from tweet where tweet_id = 5))