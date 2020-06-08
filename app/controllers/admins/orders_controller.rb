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

		if @order.order_status == 2
			@order.order_products.each do |op|
				op.update(production_status: 2)
			end
		end
		redirect_back(fallback_location: root_path)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

	def order_product_params
		params.require(:order_product).permit(:id, :production_status)
	end
end
