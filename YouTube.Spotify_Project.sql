-- delete rows that have less than 1000 likes or 1000 views
DELETE FROM practice_stuff.spotify_youtube
WHERE Views < 1000 OR Likes < 1000;
-- drop unecessary collumns
ALTER TABLE practice_stuff.spotify_youtube
DROP Description;
-- update collumns 'stream' and 'views' to replace their empty cells with zeros
SET SQL_SAFE_UPDATES = 0;
UPDATE practice_stuff.spotify_youtube
SET Comments =Null WHERE Views= ' ';
-- change view,stream, likes, and comments to intergers since they're currently text values (we use BIGINT instead of INT function)
ALTER TABLE practice_stuff.spotify_youtube
	MODIFY Views BIGINT;
ALTER TABLE practice_stuff.spotify_youtube
	MODIFY Comments BIGINT;
-- remove songs where stream is equal to 'none'
DELETE FROM practice_stuff.spotify_youtube
WHERE Stream = 'None'
-- select the top 50 songs based on youtube views
SELECT *
FROM practice_stuff.spotify_youtube
ORDER BY Views DESC
LIMIT 50
-- select the top 50 songs based on spotify streams
SELECT *
FROM practice_stuff.spotify_youtube
ORDER BY Stream DESC
LIMIT 50
-- join both new tables to see which songs appear on both lists
SELECT *
FROM portfolio.Top50songs_Views
INNER JOIN portfolio.Top50songs_Streams
ON portfolio.Top50songs_Views.Artist = portfolio.Top50songs_Streams.Artist