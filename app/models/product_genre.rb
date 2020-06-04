class ProductGenre < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :category, presence: true
end
