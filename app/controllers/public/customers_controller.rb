class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @post = Post.new
  end

  def edit
    @customer = current_customer
  end

  #　会員情報の更新
  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path
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
    params.require(:customer).permit(:account_name, :email, :password, :password_confirmation)
  end

end
