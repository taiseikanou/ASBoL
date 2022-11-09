class Post < ApplicationRecord
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
end
