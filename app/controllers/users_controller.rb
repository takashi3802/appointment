class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:show, :update, :edit, :destroy]

  def show
    @user = User.find(params[:id])
    @appoints = Appoint.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :age, :gender_id, :occupation, :phone, :trouble)
  end

  def move_to_index
    user = User.find(params[:id])
    redirect_to root_path unless current_user.id == user.id
  end
end
