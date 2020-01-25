class MessagesController < ApplicationController
  before_action :set_group
  def index
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
