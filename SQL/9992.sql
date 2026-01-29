select artist,count(artist) from spotify_worldwide_daily_song_ranking
group by artist;