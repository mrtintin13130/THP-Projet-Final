
  class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if @user.id == current_user.id
			@user = current_user
		else
			@user = User.find(params[:id])
		end
		# if @user != nil
		# 	@user_names = @user.last_name + " " + @user.first_name
		# end
	end

	def index
		@user = User.all
		@article = Article.all

end

  def create
   
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



