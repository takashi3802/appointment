class StaffsController < ApplicationController
  before_action :if_not_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]

  def index
    @staffs = Staff.all.order('created_at ASC')
    @appoints = Appoint.all
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

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if Staff.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @staff = Staff.find(params[:id])
  end

  private

  def staff_params
    params.require(:staff).permit(:image, :name, :gender_id, :age, :advantage, :position, :appeal)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
