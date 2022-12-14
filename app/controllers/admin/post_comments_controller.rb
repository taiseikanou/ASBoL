class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def def create
    post = Post.find(params[:post_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end



  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
