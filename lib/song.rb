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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name=name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name=name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    song_array = file[0...file.length-4].split("-")
    new_song = Song.new
    new_song.name = song_array[1].strip
    new_song.artist_name = song_array[0].strip
    new_song
  end

  def self.create_from_filename(file)
    song_array = file[0...file.length-4].split("-")
    new_song = self.create_by_name(song_array[1].strip)
    new_song.artist_name = song_array[0].strip
  end

  def self.destroy_all
    self.all.clear
  end


end
