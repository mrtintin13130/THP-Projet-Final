class HomeController < ApplicationController
	def index
		@messages_sum = Message.all.count
		@users_sum = User.all.count
		@articles_sum = Article.all.count
		@user = current_user
	end
end
