class Members::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@tax = 1.1
	end

	def genre_index
		@genre = ProductGenre.find(params[:id])
	end
end
