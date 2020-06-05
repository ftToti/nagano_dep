class Members::MembersController < ApplicationController
	def show
		@member = Member.find(params[:id])
	end
	def edit
		@member = Member.find(params[:id])
	end
	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
			redirect_to members_member_path(@member)
		else
			render "edit"
		end
	end
	def disable_confirm
		@member = Member.find(params[:id])
	end
	def disable
		@member = Member.find(params[:id])
		#is_enabledカラムにフラグを立てる(defaultはtrue)
		@member.update(is_enabled: false)
		reset_session
		flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
		redirect_to root_path
	end

	private
	def member_params
		params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
	end
end