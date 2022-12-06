class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_member, only:[:show,:edit,:withdrawal]
  def index
    @members = Member.all.order(created_at: :desc)
  end

  def show
    @posts = @member.posts.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit

  end

  def withdrawal

    if @member.member_status==false
      @member.update(member_status: "true")
      flash[:notice] = "退会処理を実行いたしました"
    redirect_to request.referer
    elsif @member.member_status==true
      @member.update(member_status: "false")
      session
      flash[:notice] = "入会処理を実行いたしました"
      redirect_to request.referer
    end
  end


  private

  def member_params
    params.require(:member).permit(:name, :nickname,:email,:member_status)
  end
  
  def set_member
    @member = Member.find(params[:id])
  end

end
