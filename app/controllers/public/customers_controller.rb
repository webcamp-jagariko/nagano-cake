class Public::CustomersController < ApplicationController
before_action :authenticate_user!, except: [:top, :homes]

  def show
    @customer = Customer.find(current_customer)
  end

  def edit
  end

  def confirm
  end

  def update
  end

  def withdraw
  end
end
