class Members::TopController < ApplicationController
	def top
		@products = Product.joins(:product_genre).where(product_genres: {is_enabled: true}).limit(4)
		@tax = 1.1
	end

	def about
	end
end
