with blockers(user_name)
as (select blocker_username from blocks where blocked_username = 'zad' )
select liker_username 
from favorite
where favorite_tweet_id = 7 and (select sender_username from tweet where tweet_id = 7) not in (select user_name from blockers)