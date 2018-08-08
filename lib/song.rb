require 'pry'
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
    return song
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
    return song
  end

  def self.find_by_name(string)
    self.all.find do |song|
      song.name == string
    end
  end

  def self.find_or_create_by_name(string)
      if self.find_by_name(string)
        self.find_by_name(string)
      else
        self.create_by_name(string)
      end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    song = self.new
    song.artist_name = file.split(" - ")[0]
    song.name = file.split(" - ")[-1].split(".")[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new
    song.artist_name = file.split(" - ")[0]
    song.name = file.split(" - ")[-1].split(".")[0]
    self.all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
