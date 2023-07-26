class Admin::OrderSearchesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
  end
end
