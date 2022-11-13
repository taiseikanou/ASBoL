class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def post_params
    params.require(:post).permit(:explanation,:shop_name,:member_id,:image)
  end
end
