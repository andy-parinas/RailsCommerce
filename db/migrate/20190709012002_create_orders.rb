class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_identification
      t.decimal :total, default: 0
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
