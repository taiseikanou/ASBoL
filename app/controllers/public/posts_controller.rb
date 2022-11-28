class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  def index
    @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
  end

  def favoritepost
    @favorites = Favorite.where(member_id: current_member.id)
  end

  def new
    @post = Post.new
    @category = params[:category]
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
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
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:notice] = "記入していない欄があるため、投稿できません"
      redirect_to request.referer
    end
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member_id
    @post_comment = PostComment.new
  end

  def post_comment
    @post = Post.find(params[:id])
    @member = @post.member_id
    @post_comment = PostComment.new
  end


  private



  def post_params
    params.require(:post).permit(:comment,:name,:member_id,:image,:address,:category,:asbol,:name)
  end
end