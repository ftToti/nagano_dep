class Admins::ProductGenresController < ApplicationController
	def index
		@genres = ProductGenre.all
		@genre = ProductGenre.new
	end

	def create
		@genre = ProductGenre.new(product_genre_params)
		if @genre.save!
			redirect_to admins_product_genres_path
		else
			render "index"
		end

	end

	def edit
		@genre = ProductGenre.find(params[:id])
	end

	def update
		@genre = ProductGenre.find(params[:id])
		if @genre.update(product_genre_params)
			redirect_to admins_product_genres_path
		else
			render "edit"
		end
	end


	private
	def product_genre_params
		params.require(:product_genre).permit(:category, :is_enabled)
	end
end
