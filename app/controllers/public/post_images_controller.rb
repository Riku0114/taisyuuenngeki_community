class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    flash[:notice] = "投稿が成功しました"
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    flash[:notice] = "更新しました"
    redirect_to post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "削除しました"
    redirect_to user_path(current_user.id)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:gekidann_name, :yakusya_name, :post_content, images: [])
  end
end
