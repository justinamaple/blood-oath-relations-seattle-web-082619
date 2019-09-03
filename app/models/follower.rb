# frozen_string_literal: true

class Follower
  attr_reader :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto

    @@all << self
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end

  def oaths
    BloodOath.all.select { |bo| bo.follower == self }
  end

  def cults
    oaths.map(&:cult)
  end

  def my_cults_slogans
    cults.map(&:slogan)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    all.select { |follower| follower.age >= age }
  end

  def self.most_active
    all.max_by { |follower| follower.cults.count }
  end

  def self.top_ten
    hash = all.group_by { |follower| follower.cults.count }
    keys = hash.keys.sort
    array = []
    i = 1

    while array.size < 10 && i < keys.size
      group = hash[keys[-i]]
      group.each { |follower| array << follower }
      i += 1
    end
  end
end
