# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "AJOUT CATEGORY"

Category.create(name: "pantalon")
Category.create(name: "sweat")
Category.create(name: "chaussure")
Category.create(name: "lunette")
Category.create(name: "casquette")
Category.create(name: "chaussette")
Category.create(name: "veste")
Category.create(name: "echarpe")
Category.create(name: "tshirt")
Category.create(name: "bracelet")
Category.create(name: "montre")
Category.create(name: "debardeur")
Category.create(name: "blouson")
Category.create(name: "pull")
Category.create(name: "short")
Category.create(name: "ceinture")

puts "Done !"



puts "AJOUT USER"
20.times do
	user = User.new(email: Faker::Internet.email, password: "testtest", password_confirmation: "testtest", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, sex: Faker::Gender.binary_type, username: Faker::Name.middle_name, city: Faker::Address.city, username: Faker::FunnyName.name)
	user.save!
end
puts "Done !"



puts "AJOUT ARTICLES"

50.times do
	Article.create(title: Faker::App.name, description: Faker::Lorem.paragraph, size: Faker::Number.between(30, 45), status: true, user_id: Faker::Number.between(1, 20), category_id: Faker::Number.between(1, 16) )
end


puts "Done!"

# puts "AJOUT ECHANGES"

# 15.times do
# 	Exchange.create(applicant_user_id: Faker::Number.between(1, 10), owner_user_id: Faker::Number.between(1, 10), applicant_article_id: Faker::Number.between(1, 15), owner_article_id: Faker::Number.between(1, 15), status: true )
# end
# puts "Done!"


puts "AJOUT MESSAGES"

# 100.times do
# 	Message.create(content: Faker::OnePiece.quote, dest_user_id: Faker::Number.between(1, 10), user_id: Faker::Number.between(1, 10))
# end



# puts "Done!"

