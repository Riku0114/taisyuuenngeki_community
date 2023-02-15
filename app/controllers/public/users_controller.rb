class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.all.order(created_at: :desc).page(params[:page])
  end

  def comments
    @user = User.find(params[:id])
    @comments = @user.comments.all.order(created_at: :desc).page(params[:page])
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites.all.order(created_at: :desc).page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] = "更新しました"
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction)
  end
end
