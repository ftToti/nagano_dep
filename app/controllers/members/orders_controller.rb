class Members::OrdersController < ApplicationController

  def index
    @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order =Order.new(order_params)
    @oreder.member_id = current_member.id
    @order.save
  end

  def confirm
    @order = Order.new(order_params)
    @carts = current_member.cart_items
    @tax = 1.1
    if params[:shipping_address] == "1"
      @order.postcode = current_member.postcode
      @order.address = current_member.address
      @order.addressee = current_member.last_name + current_member.first_name
    elsif params[:shipping_address] == "2"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address])
      @order.postcode = @shipping_address.postcode
      @order.address = @shipping_address.address
      @order.addressee = @shipping_address.addressee
    end
  end

  def update
    @order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to members_orders_thanks_path
  end

  def thanks

  end

  private
	def order_params
    params.require(:order).permit(:member_id, :payment_method, :order_status, :postcode, :address, :addressee)
  end
end
