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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    name = @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.all.find{|song| song.name == name}
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    separated_name = file_name.split(" - ")
    artist_name = separated_name[0]
    song_name = separated_name[1].chomp(".mp3")
    ## or song_name = separated_name[1].split(".")[0]
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save ## new_from_filename is just initializes song, but not save.
  end

  def self.destroy_all
    @@all.clear
  end


end #end of the calss
