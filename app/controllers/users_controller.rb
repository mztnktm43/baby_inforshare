class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items.order('created_at DESC')
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to new_user_session_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :parent_id)
  end

end
