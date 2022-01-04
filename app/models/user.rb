class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  validates :name_kanji_last, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_kanji_first, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_kana_last, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_kana_first, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth, presence: true

  has_many :items
  has_many :purchase_records
end
