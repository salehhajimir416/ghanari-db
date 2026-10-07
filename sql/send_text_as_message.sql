INSERT  INTO message(sender_username , receiver_username , sending_time , content)
SELECT 'message sender','receiver' , NOW() , 'text'
WHERE 'message sender' NOT IN (SELECT blocked_username FROM blocks WHERE blocker_username = 'receiver')
 