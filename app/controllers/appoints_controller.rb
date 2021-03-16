class AppointsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :destroy, :edit, :update]
  before_action :if_admin, only: [:create, :new, :destroy, :edit, :update]

  def new
    @appoints = Appoint.all
    @appoint = Appoint.new
  end

  def create
    @appoint = Appoint.create(appoint_params)
    if @appoint.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def appoint_params
    params.require(:appoint).permit(:time_select_id, :start_time).merge(user_id: current_user.id, staff_id: params[:staff_id])
  end

  def if_admin
    redirect_to root_path if current_user.admin?
  end
end
