class StaffsController < ApplicationController
  before_action :if_not_admin, only: [:new, :create]

  def index
    @staffs = Staff.all.order('created_at ASC')
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

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
