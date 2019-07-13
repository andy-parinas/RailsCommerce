class OrdersController < ApplicationController

  before_action :set_order, only: [:destroy, :update]

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new

    if !session[:order_identification].nil?
        @order = Order.find_by order_identification: session[:order_identification]
        if @order.nil?
          # If there is a case where the Session Exist but not the Order Created. 
          # Delete the Session then create again using the created order
          delete_order_session_identification
          @order = @order = Order.create!
          session[:order_identification] = @order.order_identification
        end
    else
        @order = Order.create!
        session[:order_identification] = @order.order_identification
    end

    @products = Product.all
    @order_item = OrderItem.new

  end

  def update

    if @order.update(order_params)
        delete_order_session_identification
        redirect_to root_path, notice: 'Order was successfully completed'
    else
        redirect_to new_order_path
    end


  end

  def cancel 
    delete_order_session_identification
    redirect_to root_path , notice: 'Order was cancelled'
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private

  def set_order
      @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total, :completed)
  end

  def delete_order_session_identification
    session.delete(:order_identification)
  end




end
