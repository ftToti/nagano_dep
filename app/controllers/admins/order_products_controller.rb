class Admins::OrderProductsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@op = OrderProduct.find(params[:id])
		@order = @op.order
		@op.update(order_product_params)
		if @order.order_products.exists?(production_status: 3)
			@order.update(order_status: 3)
		end
		if @order.order_products.count == @order.order_products.where(production_status: 4).count
			@order.update(order_status: 4)
		end
		redirect_back(fallback_location: root_path)
	end
	private
	def order_params
		params.require(:order).permit(:id, :order_status)
	end
	def order_product_params
		params.require(:order_product).permit(:id, :production_status)
	end
end

