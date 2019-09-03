# frozen_string_literal: true

class BloodOath
  attr_reader :cult, :follower, :initiation_date

  @@all = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = Time.new.strftime('%Y-%m-%d')

    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    @@all[0].follower
  end
end
