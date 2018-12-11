class MessagesController < ApplicationController
  before_action :set_user, only: [:new, :index] 
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @message = Message.new

    if user_signed_in?
     @message_info = Message.find(params[:format])
     @destinataire_id = @message_info.dest_user_id

     if @message_info.dest_user_id != @user.id
      @destinataire = User.find(@destinataire_id).last_name
      @messages = Message.where(user_id: @user.id, dest_user_id: @destinataire_id) + Message.where(user_id: @destinataire_id, dest_user_id: @user.id )



    else
      @expediteur = User.find(@message_info.user_id).last_name
      @messages = Message.where(user_id: @message_info.user_id, dest_user_id: @message_info.dest_user_id) + Message.where(user_id: @message_info.dest_user_id, dest_user_id: @message_info.user_id )
    end 


    
    
  else
    redirect_to root_path
  end

end

def index
 if user_signed_in?
  @messages_get = Message.where(dest_user_id: current_user.id)
  @messages_sent = Message.where(user_id: current_user.id)
  if @user != nil && @user.last_name != nil && @user.first_name != nil
    @user_names = @user.first_name + " " + @user.last_name
  end 
  @id = params[:id]
else
  redirect_to root_path
end




end 


def create

 dest_id = Message.find(params[:dest_id]).dest_user_id
 if dest_id == current_user.id
  dest_id = Message.find(params[:dest_id]).user_id
end



@message = Message.new(content: params[:message][:content], user_id: current_user.id, dest_user_id: dest_id)

respond_to do |format|
  if @message.save
    format.html { redirect_to request.referrer }
    format.json { render :show, status: :created, location: @message }
  else
    format.html { render :new }
    format.json { render json: @message.errors, status: :unprocessable_entity }
  end
end
end


def destroy
 @message.destroy
 respond_to do |format|
  format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
  format.json { head :no_content }
end
end

private

def set_user
  @user = current_user
end

def set_message
  @message = Message.find(params[:id])
end

def message_params
  params.fetch(:message, {})
end

end
