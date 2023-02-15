class Public::HomesController < ApplicationController
  def top
    @yakusya = 1
    @gekidann = 1
    @post_image_favorite_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(10).pluck(:post_image_id))
    @yakusya_names = PostImage.group(:yakusya_name).order('count_yakusya_name DESC').limit(5).count(:yakusya_name)
    @gekidann_names = PostImage.group(:gekidann_name).order('count_gekidann_name DESC').limit(5).count(:gekidann_name)
  end

  def about
  end
end
