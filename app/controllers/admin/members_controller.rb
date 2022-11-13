class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
  end

  def edit
  end




  private

  def member_params
    params.require(:member).permit(:name, :nickname, :favorite_alcohol)
  end

end
