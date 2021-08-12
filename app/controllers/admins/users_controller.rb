class Admins::UsersController < AdminsController
  before_action  :set_user, only: [:update, :edit, :change_password]
  def update
    if @user.update(users_params)
      redirect_to root_path, notice: 'Password Berhasil Diganti.'
    else
      render 'change_password'
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
