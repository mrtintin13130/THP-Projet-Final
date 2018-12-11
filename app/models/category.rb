class Category < ApplicationRecord

  has_many :articles

  def self.all_category
    all_category = ["tshirt", "pantalon", "chaussure", "sweatshirt", "veste"]

  end

end
