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
   song= self.new
   @@all << song
   return song

  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song

  end

  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name== song_name
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
    @@all.sort_by {|song|
    song.name}
  end

  def self.new_from_filename(file_name)
    s_name = file_name.split(" - ")
    song =self.new
    song.name = s_name[1][0..-5]
    song.artist_name = s_name[0]
    song
  end


  def  self.create_from_filename(file_name)
    if file_name.end_with?(".mp3")
      song = self.new_from_filename(file_name)
      @@all <<song
    end
  end


  def self.destroy_all
    @@all.clear
  end
end
