class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member_id
    @post_comment = PostComment.new
  end
  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得
    @post.destroy  # データ（レコード）を削除
    redirect_to admin_posts_path  # 投稿一覧画面へリダイレクト
  end

  def post_params
    params.require(:post).permit(:explanation,:shop_name,:member_id,:image)
  end
end
