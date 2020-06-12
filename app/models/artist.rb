class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    first_genre = self.songs.first.genre_id
    Genre.all.find{|genre_obj| genre_obj.id == first_genre}
  end

  def song_count
    self.songs.length
  end

  def genre_count
    array = self.songs.map {|song_obj| song_obj.genre_id}.uniq
    array.length
  end
end
