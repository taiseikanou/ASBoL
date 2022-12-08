class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post, only: [:destroy, :edit, :update, :show, :post_comment]
  before_action :set_member, only: [:show, :post_comment]
  def index
    @posts = Post.page(params[:page]).per(30).order(created_at: :desc)
  end

  def favoritepost
    @favorites = Favorite.where(member_id: current_member.id)
  end

  def new
    @post = Post.new
    @category = params[:category]
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def edit
  end

  def update
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
  end

  def post_comment
    @post_comment = PostComment.new
  end

  private

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