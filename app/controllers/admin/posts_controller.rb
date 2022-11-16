class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member_id
    @post_comment = PostComment.new
  end
  def destroy
  end

  def post_params
    params.require(:post).permit(:explanation,:shop_name,:member_id,:image)
  end
end
