# frozen_string_literal: true

require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
justin = Follower.new('Justin', 27, 'Walls are meant to be climbed.')
ian = Follower.new('Ian', 29, 'Eat. Pry. Love.')
ren = Follower.new('Ren', 24, 'Chill.')
kara = Follower.new('Kara', 21, 'You win some, you lose some.')
krista = Follower.new('Krista', 21, 'Dance like nobody is watching.')

flat_iron = Cult.new('Flatiron', 'Seattle', 2004, 'Make no little plans')
espresso = Cult.new('Espresso', 'Floor 10', 2019, 'Caffiene is life')
climbing = Cult.new('Climbing', 'Seattle', 1992, 'Allez!')

flat_iron.recruit_follower(justin)
flat_iron.recruit_follower(ian)
flat_iron.recruit_follower(ren)
kara.join_cult(flat_iron)
krista.join_cult(flat_iron)

justin.join_cult(espresso)
kara.join_cult(espresso)

climbing.recruit_follower(justin)

binding.pry
puts 'Mwahahaha!' # just in case pry is buggy and exits
