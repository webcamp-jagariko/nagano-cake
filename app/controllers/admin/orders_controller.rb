class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @customer_name = @customer.last_name + @customer.first_name
    @order_address = "〒#{@order.post_code} #{@order.address} #{@customer_name}"
    @order_details = @order.order_details

    @subtotal = 0
    @order_details.each do |order_detail|
      @subtotal += order_detail.item.price * order_detail.quantity
    end
    @postage = 800
    @total = @subtotal + @postage
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

private

  def order_params
    params.require(:order).permit(:status)
  end

end

