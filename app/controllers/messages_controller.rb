class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to staff_path(@message.staff_id)
    else
      render 'staffs/show'
    end
  end

  private

  def message_params
    params.permit(:text).merge(user_id: current_user.id, staff_id: params[:staff_id])
  end
end
