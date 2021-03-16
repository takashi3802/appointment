class AppointsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


 def index
  @appoints = Appoint.all
 end

 def new
  @appoint = Appoint.new
 end

 def create
  @appoint = Appoint.create(appoint_params)
  if @appoint.save
    redirect_to staff_appoints_path
  else
    render :new
  end
 end

 private
 
 def appoint_params
   params.require(:appoint).permit(:time_select_id, :start_time).merge(user_id: current_user.id, staff_id: params[:staff_id])
 end

end