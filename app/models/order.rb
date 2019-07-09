class Order < ApplicationRecord
    has_many :order_items, dependent: :destroy

    before_save :set_order_identification, :set_order_total

    private

    def compute_total
        self.order_items.collect{|order_item| order_item.valid? ? order_item.subtotal : 0}.sum
        # the statement above will iterate to the order_items
        # create a new array with order_item.subtotal
        # return a sum of the array


    end

    def set_order_identification
        self.order_identification = SecureRandom.uuid
    end

    def set_order_total
        self.total = compute_total
    end

end
