class Members::CartItemsController < ApplicationController
	def show
	end

	def create
	end

	def update
	end

	def destroy
	end

	def destroy_all
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:member_id, :product_id, :number)
end
