class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  
  # test 
  def sub_total
    amount * item.price
  end
  
end
