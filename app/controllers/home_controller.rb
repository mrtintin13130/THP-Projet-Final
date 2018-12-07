class HomeController < ApplicationController


	def index
		@user = current_user
		if @user != nil
			@user_names = @user.last_name.capitalize + " " + @user.first_name.capitalize
		end
	end
end
