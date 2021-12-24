class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text   :item_text, null: false
      t.integer :item_category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :postage_included_id, null: false
      t.integer   :price, null:false
      t.references :user, null:false,foreign_key: true
      t.integer :area_id, null:false
      t.integer :send_day_id, null:false
      t.integer :okurisaki_id, null:false
      t.integer :genre_id, null:false
      t.integer :item_quality_id, null:false
      t.integer :haisouryou_id, null:false
      t.integer :hassou_id, null:false

      t.timestamps
    end
  end
end

