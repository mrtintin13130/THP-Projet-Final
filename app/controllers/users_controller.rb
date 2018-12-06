
class UsersController < ApplicationController

  def new
    @user = User.new
  end
def index
	@user = User.all
	@article = Article.all
end

  def create
    @user = User.new(user_params)
 
    if @user.save
      redirect_to user_path(params[:id]) 
    else
      render :new
    end
end
 
 
	  def show
	   if user_signed_in?
		    @user = current_user
	  else

	    @user = User.find(params[:id])
	    if @user.destroy
	      log_out
	      flash[:success] = 'User has been successfuly deleted'
	      redirect_to root_path
	    
	  end
	end
	end
	  


	  def edit
	current_user
	    @user = User.find(params[:id])
	    
	    
	    
	  end

	  def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	      flash[:success] = 'User information successfully updated'
	      redirect_to user_path(params[:id])
	    
	  end
	end

	  def destroy

	before_action :set_user

	 

	  private

	 




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

	  def user_params
	    params.require(:user).permit(:last_name, :first_name, :birth_date, :email, :password, :avatar)
	  end
		def set_user
			@user = current_user
		end
	end



