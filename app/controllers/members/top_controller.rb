class Members::TopController < ApplicationController
	def top
		@members = Member.all
	end
end
