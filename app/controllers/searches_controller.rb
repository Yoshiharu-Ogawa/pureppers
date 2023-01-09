class SearchesController < ApplicationController

  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    elsif @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @tag_posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    end
  end

end
