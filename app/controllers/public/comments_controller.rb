class Public::CommentsController < ApplicationController

  def create
    @comment = current_customer.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post)
    # redirect_back(fallback_location: post_path(@post))  #コメント送信後は、一つ前のページへリダイレクトさせる。
    # else
    #   redirect_back(fallback_location: posts_path(@post))  #同上
    # end
  end

  def update
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.update(comment_content: "コメントが削除されました")
    redirect_to request.referer
  end

  def destroy
    # ルーティングをネストしている場合は引数2つ必要
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    comment.destroy
    # 同じページをリダイレクト
    redirect_to request.referer
  end

  def show
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
  end

  def delete_comments
    @comments = Comment.delete_comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
