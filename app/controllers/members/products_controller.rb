class Members::ProductsController < ApplicationController
	def index
		@tax = 1.1
		@products = Product.joins(:product_genre).where(product_genres: {is_enabled: true}).page(params[:page]).reverse_order
		@pn = Product.joins(:product_genre).where(product_genres: {is_enabled: true}).count
	end

	def show
		@cart_item = CartItem.new
		@product = Product.find(params[:id])
		@tax = 1.1
	end

	def genre_index
		@genre = ProductGenre.find(params[:id])
		@products = @genre.products.joins(:product_genre).where(product_genres: {is_enabled: true}).page(params[:page]).reverse_order
		@pn = @genre.products.joins(:product_genre).where(product_genres: {is_enabled: true}).count
		@tax = 1.1
	end

	def search
		@product = Product.new
    	@member_or_product = params[:option]
    	@how_search = params[:choice]
	    if @member_or_product == "1"
	      @members = Member.search(params[:search], @member_or_product, @how_search)
	    else
	      @products = Product.search(params[:search], @member_or_product, @how_search)
	    end
    end
end
