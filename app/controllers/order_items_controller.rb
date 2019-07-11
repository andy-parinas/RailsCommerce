class OrderItemsController < ApplicationController



  def create
    puts "Order Item Create"
    @product = Product.find(order_item_params[:product_id])
    @order = Order.find_by order_identification: session[:order_identification]

    respond_to do |format|

      if @product.valid? && @order.valid?

        if @order.order_items.create!(order_item_params)
          # redirect_to new_order_path, notice: 'Order Item added'
          format.js
        else
          redirect_to new_order_path
        end
      
      else
        redirect_to new_order_path, notice: 'Product does not exist'
      end

    end

  end


  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :discount)
  end
end
