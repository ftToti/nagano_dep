class Members::CartItemsController < ApplicationController
	def show
		@carts = current_member.cart_items
		@tax = 1.1
	end

	def create
		@cart = CartItem.new(cart_item_params)
		@cart.save
		redirect_to members_products_path
	end

	def update
		@cart = CartItem.find(params[:id])
		if @cart.update(cart_item_params)
		redirect_to members_cart_item_path
		else
		redirect_to members_products_path
		end
	end

	def destroy
		@cart = CartItem.find(params[:id])
		@cart.destroy
		redirect_to members_cart_item_path
	end

	def destroy_all
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:member_id, :product_id, :number)
	end
end
