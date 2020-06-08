class Admins::TopController < ApplicationController
	before_action :authenticate_admin!

  def top
  	@orders = Order.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
  	# @orders = Order.where(created_at: Date.today)
  end
end
