class Public::GuestsController < ApplicationController
  def new_guest
    member = Member.find_or_create_by!(email: 'guest@example.com',name: "guestuser",nickname: "user") do |member|
    member.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
  end
   sign_in member
   flash[:success] = "ゲストユーザーとしてログインしました。"
   redirect_to posts_path
  end
end
