class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @user = current_user
    @user_names = @user.first_name + " " + @user.last_name
    @id = params[:id]
  end

  def show
    @user = current_user
    @messages = Message.all
  end

  def new
    @user = current_user
    @message = Message.new
    @messages = Message.all
  end

  def edit
  end

  def create
    @message = Message.new(content: params[:message][:content], user_id: current_user.id, dest_user_id: params[:dest_id])
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

  def update
    respond_to do |format|
      if @message.update(content: params[:message][:content])
        format.html { redirect_to messages_path }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
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
    def set_message
      @message = Message.find(params[:id])
    end
    def message_params
      params.fetch(:message, {})
    end
  end
