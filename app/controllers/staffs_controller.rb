class StaffsController < ApplicationController

  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
   @staff = Staff.create(staff_params)
   if @staff.save
    redirect_to root_path
   else
    render :new
   end
  end

  private

  def staff_params
    params.require(:staff).permit(:image, :name, :gender, :age, :advantage, :position, :appeal)
  end
end
