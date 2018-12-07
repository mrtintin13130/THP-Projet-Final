class UsersController < ApplicationController
before_action :set_user

  def show
    if user_signed_in?
    @user = current_user
  else
    @user = User.find(params[:id])
  end
  end


  def index
    @user = User.all
    @article = Article.all
  end

  def verification_number
    if @user.phone_verified == false
		User.sms_send(@user, @user.phone)
  end
	end

	def new_verification_number
		if params[:new] != nil
			@user.phone = params[:new]
			@user.save
		elsif params[:text] != nil
			if params[:text].to_i == @user.code_confirm
				@user.phone_verified = true
				@user.save
			end
		end
		respond_to do |format|
			format.html { redirect_to request.referrer}
		end
	end

	private

	def set_user
		@user = current_user
	end
end
