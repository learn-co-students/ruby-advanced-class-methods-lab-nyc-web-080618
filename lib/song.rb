class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(nameIn =  "N/A", artistIn = "N/A")
    @name = nameIn
    @artist_name = artistIn
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(nameIn)
    song =  Song.new(nameIn)
  end

  def self.create_by_name(nameIn)
    song = Song.new(nameIn)
    @@all << song
    return song
  end

  def self.find_by_name(nameIn)
    @@all.find do |song|
      song.name ==  nameIn
    end
  end

  def self.find_or_create_by_name(nameIn)
    if (Song.find_by_name(nameIn))
      Song.find_by_name(nameIn)
    else
      Song.create_by_name(nameIn)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(fileIn)
    filename = fileIn.split('-')
    artistName = filename[0].strip
    songName = filename[1].chomp(".mp3")
    song = Song.new(songName.strip, artistName)
    return song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create_from_filename(fileIn)
    song = Song.new_from_filename(fileIn)
    @@all << song
  end
end
