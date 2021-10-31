class Public::OrdersController < ApplicationController
  def new
    ## present?これで値が入っているかどうかを指定することができる
    if current_customer.cart_items.present?
      @order = Order.new
      @user = current_customer
    else
      redirect_to public_cart_items_path
    end

  end

  def confirm

    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    ##ifを利用しラジオボタンの選択肢を分岐
    ## orderの中のaddress_optionが0であると定義
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:address_option] == "2"
      @address = Address.new
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id
      if @address.save
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      else
        render :new
      end

    end
      #total_paymentに商品金額を追加
      #@order.total_payment = 0
      #current_customer.cart_items.map {|cart| @order.total_payment += cart.sub_total}
     # byebug


  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    order_datail = @order.order_datails.new
    order_datail.item_id = cart_item.item_id
    order_datail.price = cart_item.item.price
    order_datail.amount = cart_item.amount
    order_datail.save
    end
    @cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_datails = @order.order_datails
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :total_payment, :payment_method, :shipping_cost)
  end

end
