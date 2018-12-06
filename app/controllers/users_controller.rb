class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
		if @user.id == current_user.id
			@user = current_user
		else
			@user = User.find(params[:id])
		end
		if @user != nil
			@user_names = @user.last_name.capitalize + " " + @user.first_name.capitalize
		end
	end

	def index
		@user = User.all
		@article = Article.all
	end
end
