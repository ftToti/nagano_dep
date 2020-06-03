class Product < ApplicationRecord
	belongs_to :product_genre
	has_many :cart_items, dependent: :destroy
	attachment :image
end
