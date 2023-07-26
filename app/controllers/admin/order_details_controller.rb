class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    is_updated = true
    @order_detail = OrderDetail.find(params[:id])
    order = Order.find(@order_detail.order_id)
    @order_details = order.order_details.all
    @order_detail.update(order_detail_params)
    @order_details.each do |order_detail|
    if order_detail.production_status != "finish_producing"
      is_updated = false
    end
    end
    if @order_detail.production_status == "producing"
      order.update(status: 2)
    elsif is_updated
      order.update(status: 3)
    end

    redirect_back(fallback_location: root_path)
  end

  private
  def order_detail_params
    params.require(:order).permit(:production_status)
  end
end