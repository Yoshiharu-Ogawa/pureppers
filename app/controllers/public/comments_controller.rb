class Public::CommentsController < ApplicationController

  def create
    @comment = current_customer.comments.new(comment_params)
    @post = Post.find(post_id)
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post)
    # redirect_back(fallback_location: post_path(@post))  #コメント送信後は、一つ前のページへリダイレクトさせる。
    # else
    #   redirect_back(fallback_location: posts_path(@post))  #同上
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
    #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
