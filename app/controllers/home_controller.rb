class HomeController < ApplicationController


	def index
		@user = current_user
		# if @user != nil
		# 	@user_names = @user.last_name + " " + @user.first_name
		# end
	end
end
