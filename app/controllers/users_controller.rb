class UsersController < ApplicationController
  before_action :set_user
  
  def show

    @user = User.find(params[:id])

    if user_signed_in?
      if @user.id == current_user.id
        @user = current_user
      else
        @user = User.find(params[:id])
      end
      if @user != nil
       @user_names = @user.last_name + " " + @user.first_name
     end
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

def set_user
  @user = current_user
end
end
