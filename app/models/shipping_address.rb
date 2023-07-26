class ShippingAddress < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true

  belongs_to :customer

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

end
