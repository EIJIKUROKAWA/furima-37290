class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :item_category_id, presence: true
  validates :item_condition_id, presence: true
  validates :postage_included_id, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :area_id, presence: true
  validates :send_day_id, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :Item_condition
  belongs_to :postage_included
  belongs_to :area
  belongs_to :send_day

  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_included_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
end
