require 'rails_helper'

RSpec.describe PostImage, type: :model do

   before do
      @user = FactoryBot.create(:user)
      @post_image = FactoryBot.build(:post_image)
      @post_image.user_id = @user.id
      @post_image.save
      @favorite = Favorite.create(user_id: @user.id, post_image_id: @post_image.id)
   end

   describe 'いいねのテスト' do
      it "userのidがfavoritesのuser_idと一致していたらtrue" do
         expect(@user.id == @favorite.user_id).to be_truthy
      end
   end
end