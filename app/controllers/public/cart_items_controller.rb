class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
   ##item.showから送られてきたデータを受け取る
  def create
    @cart_item = CartItem.new(cart_item_params)
  ##customer_idにログインしているユーザの情報を与え
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
