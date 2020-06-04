class Members::OrdersController < ApplicationController

  def index

  end

  def show

  end

  def new
    @order = Order.new
  end

  def create
    @order =Order.new(order_params)
    @oreder.member_id = current_member.id
    @order.save
		redirect_to members_orders_confirm_path
  end

  def update
    @order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to members_orders_thanks_path
  end


  private
	def order_params
    params.require(:order).permit(:member_id, :postage, :subtotal, :payment_method, :order_status, :postcode, :address, :addressee)
  end
end
