-- SELECT s.title,a.artistname
-- from song s,artist a 
-- WHERE a.artistname = "artist" and
-- s.artistId = a.artistId

-- insert into "tablename"
--  (first_column,...last_column)
--   values (first_value,...last_value);


-- Query all of the entries in the Genre table
SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into "Artist"
(ArtistId,ArtistName,YearEstablished)
values (29,'八十八ヵ所巡礼',2006);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into "Album"
(AlbumId,Title,ReleaseDate,AlbumLength,Label,ArtistId,GenreId)
values (25,'○△□','08/08/12',12345,'PPR',29,9);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into "Song"
(SongId,Title,SongLength,ReleaseDate,GenreId,ArtistId,AlbumId)
values (23,'霊界ヌ〜ボ〜♨',888,'08/08/12',9,29,25);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
SELECT a.title, s.title, ar.artistName
FROM Song s 
LEFT JOIN Album a, Artist ar
ON s.AlbumId = a.AlbumId
WHERE ArtistName = "八十八ヵ所巡礼" and
s.artistId = ar.artistId

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(albumId) FROM Song GROUP BY albumId

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(artistId) FROM Song GROUP BY artistId

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(genreId) FROM Song GROUP BY genreId

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT MAX(albumLength) FROM album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT MAX(songLength) FROM song

-- Modify the previous query to also display the title of the album.
SELECT MAX(s.songLength), s.title, a.title
FROM song s
LEFT JOIN album a
WHERE a.albumId = s.albumID
