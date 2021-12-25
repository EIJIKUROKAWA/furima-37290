class Item < ApplicationRecord

validates :item_name, presence: true
validates :item_text, presence: true
validates :item_category_id, presence: true
validates :item_condition_id, presence: true
validates :postage_included_id, presence: true
validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
validates :area_id, presence: true
validates :send_day_id, presence: true
validates :user, presence: true

belongs_to :user  
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_quality
  belongs_to :okurisaki
  belongs_to :hassou
  belongs_to :haisouryou


  validates :item_quality_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :haisouryou_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :okurisaki_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :hassou_id, numericality: { other_than: 1 , message: "can't be blank"}



end
