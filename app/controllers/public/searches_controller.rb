class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "会員"
      @members = Member.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
