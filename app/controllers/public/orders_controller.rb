class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = current_customer.shipping_addresses
  end

  def index

  end

  def complete

  end

  def confirm
    
  end

  def create

  end

  def show

  end



end
