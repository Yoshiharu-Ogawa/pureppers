class Public::CustomersController < ApplicationController



  private

  def customer_params
    params.require(:customer).permit(:account_name, :email, :password, :password_confirmation)
  end

end
