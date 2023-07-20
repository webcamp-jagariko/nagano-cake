class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(9)
    @customer = @order.customer
    @customer_name = @customer.last_name + @customer.first_name
    @order_address = "〒#{@order.post_code} #{@order.address} #{@customer_name}"
    @order_details = OrderDetail.where(order_id: @order.id)

    @subtotal = 0
    @order_details.each do |order_detail|
      @subtotal += order_detail.item.price * order_detail.quantity
    end
    @postage = 800
    @total = @subtotal + @postage









    # @customer = Customer.find(params[:id])
    # @customer_name = @customer.last_name + @customer.first_name
    # # 特定の会員の注文情報
    # orders = Order.where(customer_id: params[:id])
    # orders.each do |order|
    #   @order = order
    #   @order_address = "〒#{@order.post_code} #{@order.address} #{@customer_name}"
    # end
    # @order_details = OrderDetail.find
  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end

