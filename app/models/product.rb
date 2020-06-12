class Product < ApplicationRecord
	belongs_to :product_genre
	has_many :cart_items, dependent: :destroy
	has_many :order_products, dependent: :destroy
	attachment :image

  def Product.search(search, member_or_product, how_search)
      if how_search == "1"
        Product.where(["name LIKE ?", "%#{search}%"])
      elsif how_search == "2"
        Product.where(["name LIKE ?", "%#{search}"])
      elsif how_search == "3"
        Product.where(["name LIKE ?", "#{search}%"])
      elsif how_search == "4"
        Product.where(["name LIKE ?", "#{search}"])   
      else
        Product.all
      end
  end
end
