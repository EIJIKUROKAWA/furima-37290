class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string  :shipping_number, null: false
      t.integer :area_id, null: false
      t.string :shipping_city, null: false
      t.string :shipping_address, null: false
      t.string :shipping_building
      t.string :telephone_number, null: false
      t.references :purchase_record, null:false, foreign_key: true
      t.timestamps
    end
  end
end
