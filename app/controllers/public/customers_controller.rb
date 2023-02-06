class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @post = Post.new
    @posts = Post.where(customer_id: current_customer.id)
    # @posts = Post.all
  end

  def edit
    @customer_update = current_customer
  end

  #　会員情報の更新
  def update
    customer = current_customer
    if customer.update(customer_params)
      flash[:notice] = "アカウント情報が更新されました"
      redirect_to customers_my_page_path
    else
      flash[:notice] = "アカウント情報の更新に失敗しました"
      @customer_update = Customer.find(current_customer.id)
      render :edit
    end

  end

  def unsubscribe
  end

   # 会員の退会機能
  def reject_customer
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :image, :password, :password_confirmation, :introduction, :profile_image)
  end

end
