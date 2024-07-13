SELECT COUNT(*) FROM comments as c, posts as p, votes as v, users as u WHERE u.Id = p.OwnerUserId AND p.Id = v.PostId AND p.Id = c.PostId AND p.Score>=0 AND p.Score<=16 AND p.ViewCount>=0 AND p.CreationDate<=CAST('2014-09-09 12:00:50' AS TIMESTAMP) AND u.Reputation>=1 AND u.CreationDate>=CAST('2010-07-19 19:08:49' AS TIMESTAMP) AND u.CreationDate<=CAST('2014-08-28 12:15:56' AS TIMESTAMP);