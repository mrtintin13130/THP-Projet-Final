class Category < ApplicationRecord
	has_many :articles
	def self.all_category
		@categories = Category.all
		@all_category = []
		@categories.each do |categorie|
			puts categorie.name
			@all_category << categorie.name.capitalize
		end
		return @all_category

	end
end
