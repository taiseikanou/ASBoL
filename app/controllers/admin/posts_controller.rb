class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post,only:[:edit,:show,:destroy,:post_comment,:update]
  before_action :set_member,only:[:show,:post_comment]


  def index
    @posts = Post.page(params[:page]).per(30).order(created_at: :desc)
  end

  def edit
  end

  def show
    @post_comment = PostComment.new
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  def post_comment
    @post_comment = PostComment.new
  end

  def update
     @post.update(post_params)
     redirect_to post_path(@post)
  end

  def post_params
    params.require(:post).permit(:comment,:name,:member_id,:image,:address,:category,:asbol,:name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_member
    @member = @post.member_id
  end
end
