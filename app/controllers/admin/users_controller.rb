class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page])
  end

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "更新しました"
    redirect_to admin_user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :is_deleted)
  end
end
