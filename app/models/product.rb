class Product < ApplicationRecord
	belongs_to :product_genre
	has_many :cart_items, dependent: :destroy
	has_many :order_products, dependent: :destroy
	attachment :image

  def Product.search(search, member_or_product)
    if member_or_product == "2"
      Product.where(["name LIKE ?", "%#{search}%"])
    end
  end
end
