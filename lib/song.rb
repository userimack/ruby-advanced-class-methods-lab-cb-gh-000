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
  
  def self.create()
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.create_by_name(name)
    self.new_by_name(name)
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.create_from_filename(filename)
    artist_name, song_name = filename.split(" - ")
    song_name = song_name.split(".mp3")[0]
    song = self.create()
    song.name = song_name
    song.artist_name = artist_name
    song.save 
    song
  end
end
