class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    all_songs = self.all
    all_songs.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(song_name)
    song = self.new
    artist = song_name.split(" - ")[0]
    song_n = song_name.split(" - ")[1].chomp(".mp3")
    song.name = song_n
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_name)
    song = self.new
    artist = song_name.split(" - ")[0]
    song_n = song_name.split(" - ")[1].chomp(".mp3")
    song.name = song_n
    song.artist_name = artist
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
