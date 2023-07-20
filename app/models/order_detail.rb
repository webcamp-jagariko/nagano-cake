class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def price_tax
      price*1.1
  end

end
