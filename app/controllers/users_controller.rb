# frozen_string_literal: true

class UsersController < ApplicationController
	def new
		@user = User.new 
	end
	
	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
		end
		redirect_to root_path
	end	

	private
	
	def user_params
		params.require(:user).permit(
			:name,
			:lastname,
			:phone,
			:city,
			:country,
		)
	end
end