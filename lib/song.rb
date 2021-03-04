class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(title)
    song = self.new
    song.save           # I guess we don't need to save it for this test!
    song.name = title
    song
    end

  def self.create_by_name(title)
    song = self.new
    song.save
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name (title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
    self.create_by_name(title)
    end
  end

  def self.alphabetical
  self.all.sort_by {|song| song.name}
  end

  def self.new_song_with_artist(artist, title)
    song = Song.new
    song.save
    song.name = title
    song.artist = artist
    # @title = title
    # @artist = title
  end

  def self.new_from_filename(filename)
    song = Song.new
    artist = filename.split(" - ")[0]
    title = filename.chomp(".mp3").split(" - ")[1]
    song.name = title
    song.artist_name = artist
    song
     # self.new_song_with_artist(artist, title)
    # song.save
    # song.name = title  
    # song.artist_name = artist
    # @title = title
    # @artist = artist
  end

  def self.create_from_filename(filename)
    song = Song.new
    artist = filename.split(" - ")[0]
    title = filename.chomp(".mp3").split(" - ")[1]
    song.name = title
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
end
