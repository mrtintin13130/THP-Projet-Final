
class UsersController < ApplicationController

  def show

    @user = current_user
  
      if @user != nil
       @user_names = @user.last_name + " " + @user.first_name
     end
   end
  



	  def edit
	current_user
	    @user = User.find(params[:id])
	    
	    
	    
	  end

	  def update
	    @user = current_user
	    if @user.update(user_params)
	      flash[:success] = 'Votre profil a bien eté modifié'
	      redirect_to @user
	    
	  end
	end

 def index
  if user_signed_in?
    if @user.id == current_user.id
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    if @user != nil && @user.last_name != nil && @user.first_name != nil
      @user_names = @user.last_name.capitalize + " " + @user.first_name.capitalize
    end
  end
  @user = current_user
  @users = User.all
  @article = Article.all
end
end

def verification_number

  @phoneuser = User.find(current_user.id).phone
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
	params.require(:user).permit(:email, :password, :avatar)

end



