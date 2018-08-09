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

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end

  def self.create_by_name(other_new_name)
    song = self.new
    song.name = other_new_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song|
        song.name == song_name
      }
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
    self.create_by_name(song)
    else
    self.find_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song|
    song.name
    }
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    @@all = []
  end

end
