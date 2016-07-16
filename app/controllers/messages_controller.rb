class MessagesController < ApplicationController
  def index
  end

  def received

  end

  def sent

  end

  def show
    @message = Message.find params[:id]
    if @message.unread?
      @message.mark_as_read!
    end
  end

  def new
    if params[:user_id]
      @recipient = User.find params[:user_id]
    end
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      flash[:success] = 'Message sent!'
      redirect_to users_path
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  private
  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :body)
  end
end
