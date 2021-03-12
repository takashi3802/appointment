class AppointsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

 def index
  @appoints = Appoint.all
 end

 def create
  @appoint = Appoint.create(appoint_params)
  if @appoint.save
    redirect_to appoints_path
  else
    render :index
  end
 end

 private

 def appoint_params
   params.permit(:time_select_id, :start_time)
 end

end