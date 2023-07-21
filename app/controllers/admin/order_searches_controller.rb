class Admin::OrderSearchesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @orders = Order.page(params[:page])
    @order = Order.find(params[:id])
  end
end
