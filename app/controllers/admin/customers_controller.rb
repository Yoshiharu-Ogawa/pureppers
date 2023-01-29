class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin!

  def index
    # @customers = Customer.page(params[:page])
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to request.referer
  end

end
