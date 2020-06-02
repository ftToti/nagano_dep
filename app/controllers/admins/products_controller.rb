class Admins::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@tax = 1.1
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_products_path
		else
			render "new"
		end

	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_products_path
		else
			render "edit"
		end
	end

	private
	def product_params
		params.require(:product).permit(:image, :name, :description, :product_genre_id, :unit_price, :is_sales)
	end
end
