class Admins::OrderProductsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@op = OrderProduct.find(params[:id])
		@op.update(order_product_params)
		redirect_to admins_order_path(@op.order.id)
	end
	private
	def order_product_params
		params.require(:order_product).permit(:production_status)
	end
end
