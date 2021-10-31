class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_datails = @order.order_datails
  end

  def update
  end
end
