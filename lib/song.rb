require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    person = self.new
    person.save
    person
  end

  def self.new_by_name(names)
    newsong = self.new
    newsong.name = names
    newsong
  end

  def self.create_by_name(name1)
    song = self.create
    song.name = name1
    song
  end

  def self.find_by_name(name2)
    self.all.find do |name_all|
      # binding.pry
      name_all.name == name2

    end
  end

  def self.find_or_create_by_name(name3)
      if find_by_name(name3)
        return find_by_name(name3)
      end
        return create_by_name(name3)
  end

  def self.alphabetical
    self.all.sort do |a,b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(/[-\s.]/)
    song = self.new
    song.artist_name = array[0]
    song.name = array[3] + " " + array[4] + " " + array[5] + " " + array[6]
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(/[-\s.]/)
    song = self.create
    song.artist_name = array[0]
    song.name = array[3] + " " + array[4] + " " + array[5] + " " + array[6]
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
