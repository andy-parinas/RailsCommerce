class OrderItemsController < ApplicationController



  def create

    @product = Product.find(order_item_params[:product_id])
    @order = Order.find_by order_identification: session[:order_identification]

    if @product.valid? && @order.valid?

      if @order.order_items.create!(order_item_params)
        redirect_to new_order_path, notice: 'Order Item added'
      else
        redirect_to new_order_path
      end
    
    else
      redirect_to new_order_path, notice: 'Product does not exist'
    end

  end


  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity, :discount)
  end
end
