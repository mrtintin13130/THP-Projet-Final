class UsersController < ApplicationController
before_action :set_user
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
    @article = Article.all
  end

  def verification_number
		User.sms_send(@user, @user.phone)
	end
	def new_verification_number
		if params[:new] != nil
			@user.phone = params[:new]
			@user.save
		elsif params[:text] != nil
			if params[:text].to_i == @user.code_confirm
				@user.verified = true
				@user.save
			end
		end
		respond_to do |format|
			format.html { redirect_to request.referrer}
		end
	end
	private
	def set_user
		puts "bonjour aaaaaaaaaaaa========================"
		@user = current_user
	end
end
