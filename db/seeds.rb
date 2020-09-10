# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
require "faker"

puts "destroying all DB"
User.destroy_all
Bathroom.destroy_all
Movement.destroy_all
Meal.destroy_all


puts "creating Lala"
user = User.create(name: "Lala", email: "lala@lala.com", password: "123456")

puts 'creating bathrooms'
puts "creating movements"
200.times do  

  bathroom = Bathroom.create(
  name: Faker::Movies::LordOfTheRings.location,
  address: Faker::Address.street_name,
  description: Faker::GreekPhilosophers.quote
  )

  movement = Movement.create(
  #get all the attributes for a movement
  feeling: ['😁', '😀', '😐', '😔', '😰'].sample,
  effort: ["It was easy", "It was normal, a bit of effort ", "It was hard", "It was very hard"].sample,
  duration: ["1 minute", "1 -5 minutes", "5 - 10 minutes", "10 - 15 minutes", "more than 15 minutes"].sample,
  shape: rand(1..7),
  color: ["a shade of brown", "a little green", "super green", "red", "yellow", "pale, white, clay-colored", "black"].sample,
  smell: ["a normal odor 🌹", "worse than normal ☠"].sample
  )

  movement.user = user
  movement.bathroom = bathroom
  
  movement.created_at = rand(1.years).seconds.ago
  movement.save
  
  meal = Meal.create(
  description: ["pasta", "sushi", "salad"].sample
  )
  meal.user = user
  
  meal.created_at = rand(1.years).seconds.ago
  meal.save 
  
end

puts "the end"
