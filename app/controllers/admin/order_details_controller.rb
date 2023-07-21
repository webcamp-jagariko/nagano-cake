class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:order_id])
    @order_detail.update(order_detail_params)
    byebug
    redirect_back(fallback_location: root_path)
  end

  private

  def order_detail_params
    params.require(:order).permit(:production_status)
  end
end
