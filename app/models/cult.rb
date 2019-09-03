# frozen_string_literal: true

class Cult
  attr_reader :name, :location, :founding_year, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan

    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def oaths
    BloodOath.all.select { |bo| bo.cult == self }
  end

  def cult_population
    oaths.uniq.count
  end

  def followers
    oaths.map(&:follower)
  end

  def average_age
    followers.sum(&:age) / cult_population.to_f
  end

  def my_followers_mottos
    followers.map(&:life_motto)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(founding_year)
    all.select { |cult| cult.founding_year == founding_year }
  end

  def self.least_popular
    all.min { |a, b| a.cult_population <=> b.cult_population }
  end

  def self.locations
    all.map(&:location)
  end

  def self.most_common_location
    locations.max_by { |location| find_by_location(location).count }
  end
end
