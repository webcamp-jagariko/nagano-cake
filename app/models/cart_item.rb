class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item


  def sum_tax_price
    (self.price * 1.10).round * quantity
  end

  validates :quantity, presence:true
end
