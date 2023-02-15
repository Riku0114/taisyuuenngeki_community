class Public::SearchsController < ApplicationController

  def search
    @post_images = PostImage.search(params[:keyword]).page(params[:page]).order(created_at: :desc)
    @keyword = params[:keyword]
  end
end
