class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :upc
      t.string :name
      t.decimal :price, default: 0
      t.decimal :tax, default: 0

      t.timestamps
    end
  end
end
