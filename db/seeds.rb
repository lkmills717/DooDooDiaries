# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
require "faker"

User.destroy_all
Movement.destroy_all
Meal.destroy_all

user = User.create(name: "Richard", email: "rich@rich.com", password: "123456")


20.times do
  movement = Movement.create(
  #get all the attributes for a movement
 feeling: ['😁', '😀', '😐', '😔', '😰'].sample,
 effort: ["It was easy", "It was normal, a bit of effort ", "It was hard", "It was very hard"].sample,
 duration: ["1 minute", "1 -5 minutes", "5 - 10 minutes", "10 - 15 minutes", "more than 15 minutes"].sample,
 shape: ["https://i.imgur.com/kliYgem.png", "https://i.imgur.com/XDzw3uN.png", "https://i.imgur.com/uQRhzrV.png", "https://i.imgur.com/CPQNjaP.png", "https://i.imgur.com/9uVW0r5.png", "https://i.imgur.com/yiZLVyf.png", "https://i.imgur.com/mGfzmyJ.png"].sample,
 color: ["any shade of brown", "a little green", "super green", "red", "yellow", "pale, white, clay-colored", "black"].sample,
 smell: ["a normal odor 🌹", "worse than normal ☠"].sample
)
  movement.user = user

  movement.created_at = Date.today-rand(10000)
  movement.save
end
