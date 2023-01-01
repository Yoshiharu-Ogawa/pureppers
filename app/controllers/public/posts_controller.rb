class Public::PostsController < ApplicationController

  def new
    @stock_post = Post.new
  end

  def index
    @stock_posts = Post.all
  end

  def show
    @stock_post = Post.find(params[:id])
  end

  def create
    stock_post = Post.new(post_params)
    stock_post.customer_id = current_customer.id
    if stock_post.save
      flash[:notice] = "新規投稿をしました"
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


  def edit
    @stock_post_update = Post.find(params[:id])
    if @stock_post_update.customer == current_customer
      render :edit
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
