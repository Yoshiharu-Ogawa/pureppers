class Public::PostsController < ApplicationController

  def new
    @stock_post = Post.new
  end

  def index
    @stock_posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @customer = current_customer
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
    if @stock_post.update(params[:posted_title, :posted_body])
      flash[:notice] = "投稿の更新が完了しました。"
      redirect_to posts_path
    else
      @stock_post_update = Post.find(params[:id])
      flash[:notice] = "投稿の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
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
