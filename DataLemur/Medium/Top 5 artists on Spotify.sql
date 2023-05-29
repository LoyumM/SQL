WITH
  detail
  AS

  (
    SELECT *
    FROM artists
      LEFT JOIN songs
      ON artists.artist_id = songs.artist_id
      LEFT JOIN global_song_rank
      ON songs.song_id = global_song_rank.song_id
  ),
  more_detail
  AS
  (
    SELECT artist_name, rank,
      COUNT(artist_name) OVER(PARTITION BY artist_name) as num
    FROM detail
    WHERE rank <=10
    ORDER BY rank
  )

SELECT DISTINCT artist_name,
  DENSE_RANK() OVER(ORDER BY num DESC ) AS appearnce_ranking
FROM more_detail
ORDER BY appearnce_ranking
LIMIT 6;