class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page])
    quantity = OrderDetail.all.sum(:quantity)
  end

  private

  #def total_orders(orders)
    #orders.count
  #end
end
