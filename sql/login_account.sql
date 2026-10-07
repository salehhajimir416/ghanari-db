INSERT IGNORE INTO logins
SELECT member.username , current_date()
FROM member
WHERE member.username = 'username of user' AND member.password = 'password of user'
