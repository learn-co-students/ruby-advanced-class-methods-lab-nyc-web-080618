require "pry"

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
    new_song.save #using the save method
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
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
    list = file.split(" - ")
    artist_name = list[0]
    new_song = list[1].gsub(".mp3","")

    song = self.create
    song.name = new_song
    song.artist_name = artist_name
    song
end

  def self.create_from_filename(file)
    list = file.split(" - ")
    artist_name = list[0]
    new_song = list[1].gsub(".mp3", "")

    song = self.create
    song.name = new_song
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end



end #end of class Song
