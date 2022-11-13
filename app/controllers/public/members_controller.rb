class Public::MembersController < ApplicationController
  def index
    @member = current_member
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = current_member
     if @member.update(member_params)
      flash[:success] = "登録情報を編集しました。"
      redirect_to members_path(current_customer)
     else
      flash[:alert] = "もう一度入力してください。"
      render :edit
     end
  end
  
  def withdrawal
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def member_params
    params.require(:member).permit(:name, :nickname, :favorite_alcohol)
  end

end
