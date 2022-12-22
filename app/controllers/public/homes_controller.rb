class Public::HomesController < ApplicationController

  def new_guest
    customer = Customer.find_or_create_by(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.account_name = 'ゲスト'
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
