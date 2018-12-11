# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
# 	Category.create(name: Faker::Football.competition)
# end

# 10.times do
# 	user = User.new(email: Faker::Internet.email, password: "testtest", password_confirmation: "testtest", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
# 	user.save!
# end

# 15.times do
# 	Article.create(title: Faker::Esport.game, description: Faker::LeagueOfLegends.quote, size: Faker::Number.between(30, 45), status: true, user_id: Faker::Number.between(1, 10), category_id: Faker::Number.between(1, 5))
# end


	#Category.create(name: "Tshirt")
	Category.create(name: "pantalon")
	Category.create(name: "sweat")
	Category.create(name: "chaussure")
	Category.create(name: "lunette")
