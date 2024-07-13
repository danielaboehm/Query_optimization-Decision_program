SELECT COUNT(*) FROM comments as c, posts as p, postLinks as pl, postHistory as ph, votes as v, users as u WHERE p.Id = pl.PostId AND p.Id = ph.PostId AND p.Id = c.PostId AND u.Id = c.UserId AND u.Id = v.UserId AND c.CreationDate>=CAST('2010-07-26 20:21:15' AS TIMESTAMP) AND c.CreationDate<=CAST('2014-09-13 01:26:16' AS TIMESTAMP) AND p.Score>=-1 AND p.Score<=19 AND p.CommentCount<=13 AND ph.PostHistoryTypeId=2 AND ph.CreationDate<=CAST('2014-08-07 12:06:00' AS TIMESTAMP) AND v.BountyAmount<=50 AND v.CreationDate>=CAST('2010-07-21 00:00:00' AS TIMESTAMP) AND v.CreationDate<=CAST('2014-09-14 00:00:00' AS TIMESTAMP) AND u.Views>=0 AND u.CreationDate<=CAST('2014-08-19 21:33:14' AS TIMESTAMP);