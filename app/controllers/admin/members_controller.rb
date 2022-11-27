class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @members = Member.all.order(created_at: :desc)
  end

  def show
    @member = Member.find(params[:id])
    @post = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
  end

  def withdrawal
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    if @member.member_status==false
    @member.update(member_status: "true")
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to request.referer
    elsif @member.member_status==true
      @member.update(member_status: "false")
      session
      flash[:notice] = "入会処理を実行いたしました"
      redirect_to request.referer
    end
  end

  def unsubscribe
    @member = current_member
  end




  private

  def member_params
    params.require(:member).permit(:name, :nickname,:email,:member_status)
  end

end
