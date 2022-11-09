class Public::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to request.referer
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end


  private



  def post_params
    params.require(:post).permit(:explanation,:shop_name,:member_id,:image)
  end
end
