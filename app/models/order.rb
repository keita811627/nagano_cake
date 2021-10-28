class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }

  belongs_to :customer

  def add_tax_price
       (self.price * 1.10).round
  end



end
