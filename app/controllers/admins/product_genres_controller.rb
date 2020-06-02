class Admins::ProductGenresController < ApplicationController
	def index
		@genres = ProductGenre.all
		@genre = ProductGenre.new
	end

	def create
		@genre = ProductGenre.new(product_genre_params)
		@genre.save
		redirect_to admins_product_genres_path
	end

	def edit
	end

	def update
		@genre = ProductGenre.find(params[:id])
		@genre.update(product_genre_params)
		redirect_to admins_product_genres_path
	end


	private
	def product_genre_params
		params.permit(:category, :is_enabled)
	end
end
