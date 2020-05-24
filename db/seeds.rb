# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "wiping db..."
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create!(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end
# puts "seeding ingredient"
# ingredient = Ingredient.create!(name: "Applejack")
# ingredient.save!
# puts 'finished'

# puts "seeding ingredient"
# ingredient = Ingredient.create!(name: "Lemon")
# ingredient.save!
# puts 'finished'

# puts "seeding ingredient"
# ingredient = Ingredient.create!(name: "Ice")
# ingredient.save!
# puts 'finished'

# puts "seeding ingredient"
# ingredient = Ingredient.create!(name: "Mint Leaves")
# ingredient.save!
# puts 'finished'
