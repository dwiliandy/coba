class UsersController < ApplicationController
  before_action  :set_user, only: [:update, :edit]
  def update
    if @user.update(users_params)
      redirect_to root_path, notice: 'Password Berhasil Diganti.'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(
      :email, :username, :password, :password_confirmation)
  end

end