class Public::HomesController < ApplicationController

  def new_guest
    customer = Customer.find_or_create_by(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.name = 'ゲスト'
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
    @stock_posts = Post.limit(3).order(created_at: :desc)
  end



end
