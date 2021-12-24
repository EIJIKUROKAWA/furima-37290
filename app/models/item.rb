class Item < ApplicationRecord

validates :item_name, presence: true
validates :item_text, presence: true
validates :item_category_id, presence: true
validates :item_condition_id, presence: true
validates :postage_included_id, presence: true
validates :price, presence: true
validates :area_id, presence: true
validates :send_day_id, presence: true
validates :user, presence: true

belongs_to :user  
has_one_attached :image
end
