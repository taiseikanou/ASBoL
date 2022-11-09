class Public::MembersController < ApplicationController
  def index
    @member = current_member
  end

  def show
    @member = current_member
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


  private

  def member_params
    params.require(:member).permit(:name, :nickname, :favorite_alcohol)
  end

end
