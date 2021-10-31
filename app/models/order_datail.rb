class OrderDatail < ApplicationRecord

  enum making_status: { cannot_be_produced: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }

  belongs_to :order
  belongs_to :item
  
  def add_tax_price
       (self.price * 1.10).round
  end

end
