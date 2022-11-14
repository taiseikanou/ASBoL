class Public::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得
    @post.destroy  # データ（レコード）を削除
    redirect_to member_path(current_member)  # 投稿一覧画面へリダイレクト
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     @post.update(post_params)
     redirect_to post_path(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save
    redirect_to request.referer
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member_id
    @post_comment = PostComment.new
  end


  private



  def post_params
    params.require(:post).permit(:explanation,:shop_name,:member_id,:image,:address)
  end
end