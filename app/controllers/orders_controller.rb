class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :destroy]

  def index
  end

  def show
  end

  def new

    if !session[:order_identification].nil?
        @order = Order.find_by order_identification: session[:order_identification]
    else
        @order = Order.create!
        session[:order_identification] = @order.order_identification
    end

    @products = Product.all
    @order_item = OrderItem.new

  end

  def destroy
      # @order.destroy
      # will not be deleting the Order created. But will just delete the session.

      session.delete(:order_identification)
      redirect_to root_path , notice: 'Order was cancelled'
  end


  private

  def set_order
      @order = Order.find(params[:id])
  end


end
