class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit]
  
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
    redirect_to admin_post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_post_images_path
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:gekidann_name, :yakusya_name, :post_content)
  end
end
