class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
    redirect_to request.referer
    else
      redirect_to request.referer
      flash[:notice] = "コメントが入力されていません"
    end
  end



  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end