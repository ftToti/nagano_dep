class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@products = @order.order_products
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to admins_order_path(@order)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
