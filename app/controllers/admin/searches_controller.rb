class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "投稿"
      @posts = Post.looks(params[:search], params[:word])
    else
      @members = Member.looks(params[:search], params[:word])
    end
    @word = params[:word]
  end
end
