class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :destroy, :update]

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

  def update

    if @order.update(order_params)
        redirect_to root_path, notice: 'Order was successfully completed'
    else
        redirect_to new_order_path
    end


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

  def order_params
    params.require(:order).permit(:total, :completed)
  end


end
