class Members::MembersController < ApplicationController
	def show
		@member = Member.find(params[:id])
	end
	def edit
		@member = Member.find(params[:id])
	end
	def update
		@member = Member.find(params[:id])
		@member.update(member_params)
		redirect_to members_member_path(@member)
	end

	private
	def member_params
		params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
	end
end