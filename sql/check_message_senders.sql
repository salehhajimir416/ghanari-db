 SELECT S.sender_username 
 FROM (
 SELECT DISTINCT sender_username , MAX(sending_time) AS lt
	FROM message
	WHERE receiver_username = 'username of receiver'
	GROUP BY sender_username
	ORDER BY lt DESC
    ) AS S