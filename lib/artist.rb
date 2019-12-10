# require_relative 'song.rb'
require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  #get in the habit of writing a #save method to do the second step so the app is more abstract
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  #break this into two steps next time.  A method called FIND which would do first step below
  def self.find_or_create_by_name(artist_name)
    existing_artist = self.all.detect {|artist_obj| artist_obj.name == artist_name}
    existing_artist ? existing_artist : self.new(artist_name)
  end

  def print_songs
    songs.each {|song| puts song.name}
  end
end

# Song.new("The Trooper")
# Song.new("The Number of the Beast")
# iron = Artist.new("Iron Maiden")
# Artist.new("Nirvana")
# Artist.new("The Offspring")
# Artist.new("Metallica")
