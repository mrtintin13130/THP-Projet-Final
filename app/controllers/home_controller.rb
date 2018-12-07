class HomeController < ApplicationController
	def index
		@user = current_user
		if @user != nil && @user.last_name != nil && @user.first_name != nil
			@user_names = @user.last_name.capitalize + " " + @user.first_name.capitalize
		end
	end
end