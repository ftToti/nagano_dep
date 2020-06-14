class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@products = Product.page(params[:page]).per(10)
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
			redirect_to admins_product_path(@product)
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
			render "index"
		end
	end

	def search
		@product = Product.new
		@member_or_product = params[:option]
		if @member_or_product == "1"
			@members = Member.search(params[:search], @member_or_product).page(params[:page]).per(10)
		else
			@products = Product.search(params[:search], @member_or_product).page(params[:page]).per(10)
		end
  end

	private
	def product_params
		params.require(:product).permit(:image, :name, :description, :product_genre_id, :unit_price, :is_sales)
	end
end
