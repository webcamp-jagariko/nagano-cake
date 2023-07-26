class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: {
     cannot_start: 0,
     wait_product: 1,
     producing: 2,
     finish_producing: 3
  }, _prefix: true

end
