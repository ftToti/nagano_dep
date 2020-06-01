class Admins::ProductGenresController < ApplicationController
	def index
		@genres = ProductGenre.all
		@genre = ProductGenre.new
	end

	def create
		@genre = ProductGenre.new(book_params)
		@genre.save
		redirect_back(fallback_location: root_path)
	end

	def edit
	end

	def update
	end

	private
	def book_params
		params.require(:product_genre).permit(:category, :is_enable)
	end
end
