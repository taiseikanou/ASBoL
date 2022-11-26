class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :member
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def favorited_by?(member)
    favorites.where(member_id: member).exists?
  end


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.looks(search, word)
    @post = Post.where("shop_name LIKE?","%#{word}%")
  end

enum genre: { ビール:1, ワイン:2, 日本酒:3,カクテル:4,ウイスキー:5,焼酎:6,その他:7 }


end