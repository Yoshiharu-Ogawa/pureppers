class Public::PostsController < ApplicationController

  def new
    @stock_post = Post.new
  end

  def index
    # @stock_posts = Post.all
    #created_atは作成日時　descは降順 ascは昇順
    @stock_posts = Post.order(created_at: :desc)
    
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @comments = @post.comments
     #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    @comment = current_customer.comments.new
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customers_my_page_path
  end

  def create
    stock_post = Post.new(post_params)
    stock_post.customer_id = current_customer.id
    if stock_post.save
      flash[:notice] = "新規投稿をしました"
      # postのshowへリダイレクト
      redirect_to post_path(stock_post.id)
    else
      @stock_post = Post.find(stock_post.id)
      flash[:notice] = "投稿に失敗しました　表示不可能な文字列や画像データの可能性があります。"
      render :new
    end
  end

  def update
    @stock_post = Post.find(params[:id])
    # if @stock_post.update(params[:posted_title, :posted_body])
    if @stock_post.update(post_params)
      flash[:notice] = "投稿の更新が完了しました。"
      redirect_to post_path(@stock_post.id)
    else
      @stock_post_update = Post.find(params[:id])
      flash[:notice] = "投稿の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customers_my_page_path
  end


  def edit
    @post = Post.find(params[:id])
    if @post.customer == current_customer
      render :edit
    else
      redirect_to posts_path
    end
  end

  private

  # 複数のtag_idが渡ってくるので配列の形式で記述
  def post_params
    params.require(:post).permit(:title, :body, :front_image, tag_ids: [])
  end

  # def article_params
  #   params.require(:article).permit(:body, tag_ids: [])
  # end

end
