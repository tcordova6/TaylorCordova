# Rspotify: Spotify API Through R


This package allows you to access Spotify's API using R to recieve and analyze data about Songs, Albums, Artists, Playlists and Users.

You will first have to install and run:

```r
install.packages("Rspotify")
library(Rspotify)
library(tidyverse)
```


In order to access Spotify's API you must obtain an authenticated token. Visit <a href="https://developer.spotify.com/web-api/"> this link </a> and create a Spotify app. This is where you will recieve your app_id, client_id and client_secret. You will also have to set the RedirectURIs to:http://localhost:1410/  



```r
keys <- spotifyOAuth("app_id","client_id","client_secret")
```


Getting information about a specific user:
```r
user <- getUser("eltonjohnofficial",token=keys)
user$display_name 
# [1] "Elton John"
user$id
# [1] "eltonjohnofficial"
user$followers
# [1] 1984
```


To search for an artist:
```r
find_artist <- searchArtist("Elton John",token = keys)
```


Getting playlists from a specific user:
```r
user_playlists <- getPlaylists("eltonjohnofficial", token = keys)
|id                     |name                                                                      |ownerid           | tracks|
|:----------------------|:-------------------------------------------------------------------------|:-----------------|------:|
|37i9dQZF1DX7VulteLVOkq |This Is Elton John                                                        |spotify           |     47|
|285EOSTB2SmIT1whQmMy8B |Elton John: Best Of                                                       |eltonjohnofficial |     79|
|6m6CjXVCFNbFcFl1PiDldg |Elton John: Jewel Box Experience                                          |eltonjohnofficial |    149|
|0yXLuwtRBO89D9nkeBp7dm |Elton John: Farewell Yellow Brick Road                                    |eltonjohnofficial |     25|
|40EKKVFcscdku31AThcNUK |Revamp & Restoration: Reimagining the Songs of Elton John & Bernie Taupin |eltonjohnofficial |     52|

```

To get the songs from a specific playlist:
```r
playlist_songs <- getPlaylistSongs("eltonjohnofficial","285EOSTB2SmIT1whQmMy8B",
                                   token =  keys) %>%
|tracks                                                                        | popularity|artist     |
|:-----------------------------------------------------------------------------|----------:|:----------|
|Rocket Man (I Think It's Going To Be A Long Long Time) - Remastered           |         51|Elton John |
|Your Song - Remastered                                                        |         63|Elton John |
|Tiny Dancer - Remastered                                                      |         51|Elton John |
|Crocodile Rock - Remastered                                                   |         50|Elton John |
|Don't Go Breaking My Heart - Remastered                                       |         50|Elton John |
|I'm Still Standing - Remastered                                               |         52|Elton John |
|The Bitch Is Back - Remastered                                                |         44|Elton John |
|I Want Love - Remastered                                                      |         40|Elton John |
|Saturday Night’s Alright (For Fighting) - Remastered                          |         46|Elton John |
|Border Song                                                                   |         48|Elton John |
|Rock And Roll Madonna                                                         |         34|Elton John |
|Take Me To The Pilot                                                          |         53|Elton John |
|Honky Cat - Remastered                                                        |         43|Elton John |
|Pinball Wizard - Remastered / From "Tommy" Original Motion Picture Soundtrack |         37|Elton John |
|Bennie And The Jets - Remastered                            

```

To get the features from a specific song:
```r
rocket_man <- getFeatures("3gdewACMIVMEWVbyb8O9sY", token = keys)
Rows: 1
Columns: 14
$ id               <chr> "3gdewACMIVMEWVbyb8O9sY"
$ danceability     <dbl> 0.601
$ energy           <dbl> 0.532
$ key              <int> 10
$ loudness         <dbl> -9.119
$ mode             <int> 1
$ speechiness      <dbl> 0.0286
$ acousticness     <dbl> 0.432
$ instrumentalness <dbl> 6.25e-06
$ liveness         <dbl> 0.0925
$ valence          <dbl> 0.341
$ tempo            <dbl> 136.571
$ duration_ms      <int> 281613
$ time_signature   <int> 4

```

To search tracks with specific lyrics or phrases:
```r
find_song <- searchTrack("rocket man", token = keys)
|display_name                                                        |id                     | popularity|artists                       |artists_IDs            |type  |
|:-------------------------------------------------------------------|:----------------------|----------:|:-----------------------------|:----------------------|:-----|
|Rocket Man (I Think It's Going To Be A Long, Long Time)             |3gdewACMIVMEWVbyb8O9sY |         81|Elton John                    |3PhoLpVuITZKcymswpck5b |track |
|Rocket Man                                                          |1GFhaSp0LQHDu1IUX5tM9s |         55|Taron Egerton                 |5nwjcZ87CGNRiO98nFKdOD |track |
|Rocket Man                                                          |6hWO05CFzbcnOTMnTnfl5W |         52|Me First and the Gimme Gimmes |0cOVRC8EOwDwXrs3JTrRN5 |track |
|Rocket Man                                                          |3q6BJcC0i7UyM8oWn6ntRQ |         52|My Morning Jacket             |43O3c6wewpzPKwVaGEEtBM |track |
|Rocket Man (I Think It's Going To Be A Long Long Time) - Remastered |2HlCoznsLUjxP3Plgn12bf |         51|Elton John                    |3PhoLpVuITZKcymswpck5b |track |


```




