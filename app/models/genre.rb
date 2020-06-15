class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    total_songs = Song.all.select {|song| song.genre = self}
    number_of_songs = total_songs.count
    number_of_songs
  end

  def artist_count
    # return the number of artists associated with the genre
    total_songs = Song.all.select {|song| song.genre = self}
    total_artist = total_songs.map {|song| song.artist}
    number_of_artists = total_artist.count
    number_of_artists
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    total_songs = Song.all.select {|song| song.genre = self}
    artist_names = total_songs.map {|song| song.artist.name}
    artist_names
  end
end
