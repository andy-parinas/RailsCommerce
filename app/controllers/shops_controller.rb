class ShopsController < ApplicationController

  def index
    @orders =  Order.where(completed: true, created_at: Time.now.beginning_of_day..Time.now.end_of_day)
  end

  
end
