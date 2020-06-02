class Admins::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_products_path
		else
			render new_admins_product_path
		end

	end

	def edit
	end

	def update
	end

	private
	def product_params
		params.permit(:image, :name, :description, :product_genre_id, :unit_price, :is_sales)
	end
end
