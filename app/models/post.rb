class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :main_images
  
  belongs_to :member
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true
  validates :image, presence: true
  validates :comment, presence: true


  def favorited_by?(member)
    favorites.where(member_id: member).exists?
  end


  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  def self.looks(search, word)
    @posts = Post.where("name LIKE?","%#{word}%")
  end





end