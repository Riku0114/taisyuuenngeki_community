class PostImage < ApplicationRecord
   validates :images,length: {maximum: 4}
   has_many_attached :images

   belongs_to :user

   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end

   def self.search(keyword)
    where(["gekidann_name like? OR yakusya_name like?", "%#{keyword}%", "%#{keyword}%"])
   end
end
