SELECT COUNT(*) FROM comments as c, postHistory as ph, badges as b, votes as v, users as u WHERE ph.UserId = u.Id AND v.UserId = u.Id AND c.UserId = u.Id AND b.UserId = u.Id AND b.Date>=CAST('2010-09-26 12:17:14' AS TIMESTAMP) AND v.BountyAmount>=0 AND v.CreationDate>=CAST('2010-07-20 00:00:00' AS TIMESTAMP) AND v.CreationDate<=CAST('2014-09-11 00:00:00' AS TIMESTAMP) AND u.DownVotes>=0 AND u.DownVotes<=0 AND u.UpVotes>=0 AND u.UpVotes<=31 AND u.CreationDate<=CAST('2014-08-06 20:38:52' AS TIMESTAMP);