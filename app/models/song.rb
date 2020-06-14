class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    #find or create drake
    if (drake = Artist.find_by(name: "Drake")) == nil
      drake = Artist.create(name: "Drake")
    end
    drake.songs << self       
  end
end