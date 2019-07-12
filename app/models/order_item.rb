class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :quantity, :discount, :product

  before_save :set_subtotal

  private

  def set_subtotal
      self.unit_price = product.price
      self.total_tax = self.unit_price * self.quantity * product.tax
      self.subtotal = (self.unit_price * self.quantity * (1 - self.discount.to_f / 100)) + self.total_tax
  end

  # TODO: Add the product name to the Order Items field

end
