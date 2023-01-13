class Public::BookmarksController < ApplicationController

  # before_action :authenticate_customer!

  def index
    # ログインユーザーに紐づけされたブックマーク
    @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end

  def create
    # まずはpost_idを取得
    @post = Post.find(params[:post_id])
    # その後customer_idにcurrent_customerを紐付け
    bookmark = @post.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(customer_id: current_customer.id)
    # bookmark.present?を挟んでいるのは、２度押しのエラーを回避するため
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end

end
