class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :member
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.looks(search, word)
    @post = Post.where("shop_name LIKE?","%#{word}%")
  end

end