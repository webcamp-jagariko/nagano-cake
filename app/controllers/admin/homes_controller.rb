class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page])
  end

  private

  def total_orders(orders)
    orders.count
  end
end
