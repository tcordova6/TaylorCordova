# install package
install.packages("Rspotify")


# run
library(Rspotify)
library(tidyverse)


# keys <- spotifyOAuth("app_id","client_id","client_secret")
# use your credentials
keys <- spotifyOAuth("SpotR","38db6529e4c24d2eb83154598065bb8b","f0ee13b36cd545f1bb974514ba8ee74c")


# get user function
# user <- getUser("username", token = keys) 
# use users spotify "username"
user <- getUser("eltonjohnofficial", token = keys)

# username 
user$display_name

#user ID
user$id

# number of users followers
user$followers


# getting playlists
# Elton John playlists
user_playlists <- getPlaylists("eltonjohnofficial", token = keys)
user_playlists %>% slice(1:5) %>% knitr::kable()


# getting playlist songs
# gets songs from Elton John: Best Of
playlist_songs <- getPlaylistSongs("eltonjohnofficial","285EOSTB2SmIT1whQmMy8B",
                                   token =  keys) %>%
  select(tracks, popularity, artist) 
playlist_songs %>% slice(1:15) %>% knitr::kable()


# search tracks
# search songs with specific lyric/phrase
find_song <- searchTrack("rocket man", token = keys)
find_song %>% slice(1:5)  %>% arrange(desc(popularity)) %>%
  knitr::kable()


# search artist name
find_artist <- searchArtist("Elton John",token = keys)
find_artist %>% slice(1:5)  %>% arrange(desc(popularity)) %>%
  knitr::kable()


# getting song features
rocket_man <- getFeatures("3gdewACMIVMEWVbyb8O9sY", token = keys) 
rocket_man %>% select(-uri, -analysis_url) %>% glimpse() %>% knitr::kable()