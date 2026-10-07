select count(liker_username)
from favorite 
where favorite_tweet_id = 7 and 
	not exists (select * 
				from blocks
				where blocked_username = 'hajimir' and blocker_username = ( select sender_username 
																			from tweet
                                                                            where tweet_id = 7))