require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    return_value = nil
    @@all.each do |song|
      if song.name == song_name
        return_value = song
      end
    end
    return_value
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1].gsub ".mp3", ""
    new_song = self.new
    new_song.name = title
    new_song.artist_name = artist
    @@all << new_song
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1].gsub ".mp3", ""
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end




end
