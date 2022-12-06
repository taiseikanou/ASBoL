class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member,only: [:edit,:withdrawal,:unsubscribe]
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      flash[:notice] = "記入していない欄があるため、投稿できません"
      redirect_to request.referer
    end
  end

  def unsubscribe
  end

  def withdrawal
    @member.update(member_status: "true")
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end



  private

  def member_params
    params.require(:member).permit(:name, :nickname,:email,:member_status)
  end

  def set_member
    @member = current_member
  end

end
