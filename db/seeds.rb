# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "AJOUT CATEGORIES"
5.times do
	Category.create(name: Faker::Food.fruits)
end
puts "Done!"
puts "AJOUT USERS"

10.times do
	user = User.new(email: Faker::Internet.email, password: "testtest", password_confirmation: "testtest", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, sex: Faker::Gender.binary_type)
	user.save!
end
puts "Done !"
puts "AJOUT ARTICLES"
15.times do
	Article.create(title: Faker::App.name, description: Faker::Lorem.paragraph, size: Faker::Number.between(30, 45), status: true, user_id: Faker::Number.between(1, 10), category_id: Faker::Number.between(1, 5))
end
puts "Done!"
puts "AJOUT MESSAGES"
	n = 1
100.times do
	
	Message.create(content: Faker::OnePiece.quote, dest_user_id: Faker::Number.between(1, 10), user_id: Faker::Number.between(1, 10))
	puts n
	n = n + 1 
end

# sleep 120

# 100.times do
	
# 	Message.create(content: Faker::OnePiece.quote, dest_user_id: Faker::Number.between(1, 10), user_id: Faker::Number.between(1, 10))
# 	puts n
# 	n = n + 1 
# end
puts "Done!"