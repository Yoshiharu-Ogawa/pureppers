class Admin::CommentsController < ApplicationController
  
    # before_action :authenticate_admin!

  def index
    # @comments = Comment.page(params[:page])
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def destroy
    # ルーティングをネストしている場合は引数2つ必要
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    # コメント一覧に飛ぶ
    redirect_to admin_comments_path
  end



end
