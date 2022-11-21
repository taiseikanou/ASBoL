class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :posts, dependent: :destroy
   # フォローをした、されたの関係
   has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
   has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

   # 一覧画面で使う
   has_many :followings, through: :relationships, source: :followed
   has_many :followers, through: :reverse_of_relationships, source: :follower

   def follow(member_id)
    relationships.create(followed_id: member_id)
   end
   # フォローを外すときの処理
   def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
   end
   # フォローしているか判定
   def following?(member)
    followings.include?(member)
   end



  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.looks(search, word)
      @member = Member.where("nickname LIKE?","%#{word}%")
  end


end
